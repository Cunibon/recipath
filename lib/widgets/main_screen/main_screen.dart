import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/recipe_data.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("./${MainRoutes.createRecipe.path}"),
        child: Icon(Icons.add),
      ),
      body: SearchableList(
        type: "Recipe",
        items: data,
        toSearchable: (item) => item.toReadable(groceries),
        toWidget: (item) => CompactRecipeItem(data: item),
        sort: (a, b) => a.title.compareTo(b.title),
      ),
    );
  }
}
