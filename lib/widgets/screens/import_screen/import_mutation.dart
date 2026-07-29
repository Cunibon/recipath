import 'package:bound_mutation/bound_mutation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/gorcery_tag_modifier/grocery_tag_modifier_notifier.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier_notifier.dart';
import 'package:recipath/application/tag_modifier/tag_modifier_notifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/tag_import_screen_notifier.dart';

final importMutation = BoundMutation<void, String>((tsx, path) async {
  final importData = await tsx.get(importDataProvider(path).future);

  final recipeTagImportState = await tsx.get(
    tagImportScreenProvider(path, .recipe).future,
  );
  final groceryTagImportState = await tsx.get(
    tagImportScreenProvider(path, .grocery).future,
  );

  final tagModifier = tsx.get(tagModifierProvider);

  final tagMapping = <String, String>{};

  for (final entry in [
    ...recipeTagImportState.mappedTags.entries,
    ...groceryTagImportState.mappedTags.entries,
  ]) {
    late String id;

    if (entry.value == null) {
      final original =
          (recipeTagImportState.tagLookup[entry.key] ??
          groceryTagImportState.tagLookup[entry.key])!;
      final copy = original.copyWith(id: randomAlphaNumeric(16));
      await tagModifier.add(copy);
      id = copy.id;
    } else {
      id = entry.value!.id;
    }
    tagMapping[entry.key] = id;
  }

  final groceries = await tsx.get(groceryImportScreenProvider(path).future);

  final groceryModifier = tsx.get(groceryModifierProvider);
  final groceryTagModifier = tsx.get(groceryTagModifierProvider);

  final groceryMapping = <String, GroceryData>{};

  for (final entry in groceries.entries) {
    late GroceryData grocery;

    if (entry.value == null) {
      final original = importData.groceries[entry.key]!;
      final copy = original.copyWith(id: randomAlphaNumeric(16));
      await groceryModifier.add(copy);
      grocery = copy;

      final groceryTags = importData.tagsPerGrocery[original.id] ?? {};
      for (final tag in groceryTags) {
        if (tagMapping.containsKey(tag.id)) {
          await groceryTagModifier.add(
            GroceryTagData(groceryId: copy.id, tagId: tagMapping[tag.id]!),
          );
        }
      }
    } else {
      grocery = entry.value!;
    }
    groceryMapping[entry.key] = grocery;
  }

  final recipeImportState = await tsx.get(
    recipeImportScreenProvider(path).future,
  );

  final recipeModifier = tsx.get(recipeModifierProvider);
  final recipeTagModifier = tsx.get(recipeTagModifierProvider);

  for (final recipe in recipeImportState.selectedRecipes) {
    final fixedSteps = recipe.steps.map((step) {
      final fixedIngredients = step.ingredients.map((ingredient) {
        final originalGrocery = importData.groceries[ingredient.groceryId]!;
        final newGrocery = groceryMapping[ingredient.groceryId]!;

        final isAllowed = newGrocery.isUnitAllowed(ingredient.unit);

        if (isAllowed) {
          return ingredient;
        }

        return _fixIngredient(
          ingredient: ingredient,
          originalGrocery: originalGrocery,
          newGrocery: newGrocery,
        );
      }).toIList();

      return step.copyWith(ingredients: fixedIngredients);
    }).toIList();

    final newRecipe = recipe
        .copyWith(steps: fixedSteps)
        .copyWithNewId(
          groceryLookup: groceryMapping.map(
            (key, value) => MapEntry(key, value.id),
          ),
        );

    await recipeModifier.add(newRecipe);

    final recipeTags = importData.tagsPerRecipe[recipe.id] ?? {};
    for (final tag in recipeTags) {
      if (tagMapping.containsKey(tag.id)) {
        await recipeTagModifier.add(
          RecipeTagData(recipeId: newRecipe.id, tagId: tagMapping[tag.id]!),
        );
      }
    }
  }
});

IngredientData _fixIngredient({
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
