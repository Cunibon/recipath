import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final asyncRecipe = ref.watch(recipeNotifierProvider);
    final asyncGrocery = ref.watch(groceryNotifierProvider);

    late Widget body;

    if (asyncRecipe.isLoading || asyncGrocery.isLoading) {
      body = Center(child: CircularProgressIndicator());
    } else if (asyncRecipe.hasError || asyncGrocery.hasError) {
      body = Center(child: Text('Oops, something unexpected happened'));
    } else {
      body = SearchableList(
        type: "Recipe",
        items: asyncRecipe.value!.values.toList(),
        toSearchable: (item) => item.toReadable(asyncGrocery.value!),
        toWidget: (item) => CompactRecipeItem(data: item),
        sort: (a, b) => a.title.compareTo(b.title),
        bottomPadding: 78,
      );
    }

    return NavigationDrawerScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.mainRoute.path}/${MainRoutes.createRecipe.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: body,
    );
  }
}
