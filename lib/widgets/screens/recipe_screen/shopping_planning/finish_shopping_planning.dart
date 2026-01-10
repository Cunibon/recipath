import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/recipe_shopping_modifier/recipe_shopping_modifier_notifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/dialogs/finish_shopping_planning_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/dialogs/modify_ingredients_dialog.dart';

class FinishShoppingPlanning extends ConsumerWidget {
  const FinishShoppingPlanning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final finishPlanning = await showDialog<bool>(
          context: context,
          builder: (context) => FinishShoppingPlanningDialog(),
        );

        if (finishPlanning != true) return;

        final shoppingPlan = ref.read(shoppingPlanningProvider);
        final groceries = await ref.watch(groceryProvider.future);

        if (shoppingPlan != null &&
            shoppingPlan.isNotEmpty &&
            context.mounted) {
          List<IngredientData> ingredientData = [];

          for (final entry in shoppingPlan.entries) {
            for (int i = 0; i < entry.value; i++) {
              ingredientData.addAll(entry.key.getIngredients(groceries));
            }
          }

          final aggregated = IngredientData.aggregateIngredients(
            groceries,
            ingredientData,
          );

          final modifiedIngredients = await showDialog<List<IngredientData>>(
            context: context,
            builder: (context) =>
                ModifyIngredientsDialog(ingredientDataList: aggregated),
          );

          if (modifiedIngredients != null) {
            final recipeShopping = ref.read(recipeShoppingModifierProvider);

            for (final entry in shoppingPlan.entries) {
              for (int i = 0; i < entry.value; i++) {
                await recipeShopping.addRecipe(entry.key);
              }
            }

            final shoppingModifier = ref.read(shoppingModifierProvider);
            await shoppingModifier.addItems(
              modifiedIngredients.where((element) => element.amount != 0),
              groceries,
            );

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.addedItemsToShopping,
                  ),
                ),
              );
            }
          }
        }

        ref.read(shoppingPlanningProvider.notifier).clear();
      },
      icon: Icon(Icons.done),
    );
  }
}
