import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes/root_routes.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/main_screen/compact_recipe_item.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/main_screen/providers/recipe_notifier.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(recipeNotifierProvider).values.toList();
    final groceries = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      actions: [
        IconButton(
          onPressed: () async {
            final dir = await FilePicker.platform.getDirectoryPath();
            if (dir == null) {
              throw Exception("Could not find the downloads directory");
            }

            final allData = {
              for (final key in dataKeys) key: localStorage.getItem(key),
            };

            final file = File("$dir/recipe_list.json");
            await file.writeAsString(jsonEncode(allData));
          },
          icon: Icon(Icons.download),
        ),
        IconButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ["json"],
            );

            if (result != null) {
              File file = File(result.files.single.path!);

              final data = jsonDecode(await file.readAsString());

              if (data is Map) {
                for (final key in dataKeys) {
                  localStorage.setItem(key, jsonEncode(data[key]));
                }
              }
            }
          },
          icon: Icon(Icons.upload),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.mainRoute.path}/${MainRoutes.createRecipe.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: SearchableList(
        type: "Recipe",
        items: data,
        toSearchable: (item) => item.toReadable(groceries),
        toWidget: (item) => CompactRecipeItem(data: item),
        sort: (a, b) => a.title.compareTo(b.title),
        bottomPadding: 78,
      ),
    );
  }
}
