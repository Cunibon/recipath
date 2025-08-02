import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/application/recipe_shopping_modifier/recipe_shopping_modifier_notifier.dart';
import 'package:recipe_list/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/dialogs/finish_shopping_planning.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/compact_recipe_item.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_routes.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecipe = ref.watch(recipeNotifierProvider);
    final asyncGrocery = ref.watch(groceryNotifierProvider);
    final shoppingPlan = ref.watch(shoppingPlanningNotifierProvider);

    return NavigationDrawerScaffold(
      actions: [
        if (shoppingPlan == null)
          IconButton(
            onPressed: () =>
                ref.read(shoppingPlanningNotifierProvider.notifier).start(),
            icon: Icon(Icons.shopping_cart),
          )
        else ...[
          IconButton(
            onPressed: () async {
              final clear = await showDialog<bool>(
                context: context,
                builder: (context) => ClearConfirmationDialog(),
              );

              if (clear == true) {
                ref.read(shoppingPlanningNotifierProvider.notifier).clear();
              }
            },
            icon: Icon(Icons.clear),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () async {
              final finish = await showDialog<bool>(
                context: context,
                builder: (context) => FinishShoppingPlanning(),
              );

              if (finish != true) return;

              final shoppingPlan = ref.read(shoppingPlanningNotifierProvider);

              if (shoppingPlan == null || shoppingPlan.isEmpty) return;

              final shoppingModifier = ref.read(
                shoppingModifierNotifierProvider,
              );
              final recipeShopping = ref.read(
                recipeShoppingModifierNotifierProvider,
              );

              List<IngredientData> ingredientData = [];

              for (final entry in shoppingPlan.entries) {
                for (int i = 0; i < entry.value; i++) {
                  ingredientData.addAll(
                    entry.key.getIngredients(asyncGrocery.value!),
                  );
                  await recipeShopping.addRecipe(entry.key);
                }
              }

              await shoppingModifier.addItems(
                ingredientData,
                asyncGrocery.value!,
              );

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Added items to shopping list!")),
                );
              }

              ref.read(shoppingPlanningNotifierProvider.notifier).clear();
            },
            icon: Icon(Icons.done),
          ),
        ],
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.recipeRoute.path}/${MainRoutes.createRecipe.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncRecipe, asyncGrocery],
        childBuilder: () => SearchableList(
          type: "Recipe",
          items: asyncRecipe.value!.values.toList(),
          toSearchable: (item) => item.toReadable(asyncGrocery.value!),
          toWidget: (item) => Dismissible(
            key: Key(item.id),
            child: CompactRecipeItem(data: item),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                ref
                    .read(shoppingPlanningNotifierProvider.notifier)
                    .addRecipe(item);
              } else {
                ref
                    .read(shoppingPlanningNotifierProvider.notifier)
                    .removeRecipe(item);
              }

              return false;
            },
          ),
          sort: (a, b) => a.title.compareTo(b.title),
          bottomPadding: 78,
        ),
      ),
    );
  }
}
