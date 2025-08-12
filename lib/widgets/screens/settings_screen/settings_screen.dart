import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/domain_service/import_service/data_import_service_notifier.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () async {
              final dir = await ref.read(applicationPathProvider.future);

              final allData = {
                recipeDataKey: await ref.read(recipeRepoNotifierProvider).get(),
                shoppingDataKey: await ref
                    .read(shoppingRepoNotifierProvider)
                    .get(),
                storageDataKey: await ref
                    .read(storageRepoNotifierProvider)
                    .get(),
                groceryDataKey: await ref
                    .read(groceryRepoNotifierProvider)
                    .get(),
              };

              final filePath = "${dir.path}/recipe_list.json";

              final file = File(filePath);
              await file.writeAsString(jsonEncode(allData));

              final params = ShareParams(files: [XFile(filePath)]);

              await SharePlus.instance.share(params);
            },
            icon: Icon(Icons.upload),
            label: Text("Export data"),
          ),
          TextButton.icon(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ["json"],
              );

              if (result != null) {
                File file = File(result.files.single.path!);

                final data = jsonDecode(await file.readAsString());

                if (data is Map<String, dynamic>) {
                  ref.read(dataImportServiceNotifierProvider).import(data);
                }
              }
            },
            icon: Icon(Icons.download),
            label: Text("Import data"),
          ),
          TextButton.icon(
            onPressed: () async {
              await ref.read(databaseNotifierProvider).clear();
            },
            icon: Icon(Icons.clear),
            label: Text("Clear data"),
          ),
        ],
      ),
    );
  }
}
