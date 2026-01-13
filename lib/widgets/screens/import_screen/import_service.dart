import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier.dart';
import 'package:recipath/application/tag_modifier/tag_modifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/recipe_import_screen_state.dart';

class ImportService {
  ImportService({
    required this.importData,
    required this.recipeImportState,
    required this.groceries,
    required this.recipeModifier,
    required this.groceryModifier,
    required this.tagModifier,
    required this.recipeTagModifier,
  });

  final ImportData importData;
  final RecipeImportScreenState recipeImportState;
  final Map<String, GroceryData?> groceries;

  final RecipeModifier recipeModifier;
  final GroceryModifier groceryModifier;
  final TagModifier tagModifier;
  final RecipeTagModifier recipeTagModifier;

  IngredientData fixIngredient({
    required IngredientData ingredient,
    required GroceryData originalGrocery,
    required GroceryData newGrocery,
  }) {
    final grams = originalGrocery.convertToGram(
      ingredient.amount,
      ingredient.unit,
    );

    if (UnitConversion.unitType(newGrocery.unit) == UnitType.misc) {
      final miscAmount =
          (grams / newGrocery.conversionAmount) * newGrocery.normalAmount;

      return ingredient.copyWith(unit: newGrocery.unit, amount: miscAmount);
    }

    final newAmount = newGrocery.convertFromTo(
      grams,
      UnitEnum.g,
      newGrocery.unit,
    );

    return ingredient.copyWith(unit: newGrocery.unit, amount: newAmount);
  }

  Future<void> commit() async {
    final groceryMapping = <String, String>{};

    for (final entry in groceries.entries) {
      late String id;

      if (entry.value == null) {
        final original = importData.groceries[entry.key]!;
        final copy = original.copyWith(id: randomAlphaNumeric(16));
        await groceryModifier.add(copy);
        id = copy.id;
      } else {
        id = entry.value!.id;
      }
      groceryMapping[entry.key] = id;
    }

    for (final recipe in recipeImportState.selectedRecipes) {
      final fixedSteps = recipe.steps.map((step) {
        final fixedIngredients = step.ingredients.map((ingredient) {
          final originalGrocery = importData.groceries[ingredient.groceryId]!;
          final newGrocery = groceries[ingredient.groceryId]!;

          final isAllowed = newGrocery.isUnitAllowed(ingredient.unit);

          if (isAllowed) {
            return ingredient;
          }

          return fixIngredient(
            ingredient: ingredient,
            originalGrocery: originalGrocery,
            newGrocery: newGrocery,
          );
        }).toList();

        return step.copyWith(ingredients: fixedIngredients);
      }).toList();

      await recipeModifier.add(
        recipe
            .copyWith(steps: fixedSteps)
            .copyWithNewId(groceryLookup: groceryMapping),
      );
    }
  }
}
