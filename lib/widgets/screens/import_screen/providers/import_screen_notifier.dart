import 'dart:convert';
import 'dart:io';

import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'import_screen_notifier.g.dart';

@riverpod
class ImportScreenNotifier extends _$ImportScreenNotifier {
  @override
  Future<ImportScreenState> build(String path) async {
    final file = File(path);

    final data = jsonDecode(await file.readAsString());

    final groceryData = data[groceryDataKey];
    final recipeData = data[recipeDataKey];

    final groceryMap = <String, GroceryData>{};
    final recipeList = <RecipeData>[];

    for (final data in groceryData.values) {
      final parsed = GroceryData.fromJson(data);
      groceryMap[parsed.id] = parsed;
    }

    for (final data in recipeData.values) {
      recipeList.add(RecipeData.fromJson(data));
    }

    return ImportScreenState(
      path: path,
      originalRecipe: recipeList,
      originalGrocery: groceryMap,
      importRecipe: recipeList,
      importGroceryLookup: {},
    );
  }

  void toggleRecipe(RecipeData recipe) {
    final currentState = state.value!;
    final currentList = List<RecipeData>.from(currentState.importRecipe);

    state = AsyncValue.data(
      currentState.copyWith(
        importRecipe: currentList.contains(recipe)
            ? (currentList..remove(recipe))
            : (currentList..add(recipe)),
      ),
    );
  }

  void calculateGroceries() {
    final currentState = state.value!;

    final groceryIds = currentState.importRecipe
        .expand(
          (element) => element.getIngredients(currentState.originalGrocery),
        )
        .map((e) => e.groceryId)
        .toSet();
    final groceries = {
      for (final groceryId in groceryIds)
        if (currentState.originalGrocery.containsKey(groceryId))
          groceryId: currentState.originalGrocery[groceryId]!,
    };

    state = AsyncValue.data(
      currentState.copyWith(importGroceryLookup: groceries),
    );
  }

  void selectGrocery(String origin, GroceryData groceryData) {
    final currentState = state.value!;
    final currentLookup = Map<String, GroceryData>.from(
      currentState.importGroceryLookup,
    );

    state = AsyncValue.data(
      currentState.copyWith(
        importGroceryLookup: currentLookup..[origin] = groceryData,
      ),
    );
  }

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
    final recipeModifier = ref.read(recipeModifierProvider);
    final groceryModifier = ref.read(groceryModifierProvider);
    final currentState = state.value!;

    final groceryMapping = <String, String>{};

    for (final entry in currentState.importGroceryLookup.entries) {
      late String id;

      if (currentState.originalGrocery.containsKey(entry.value.id)) {
        final copy = entry.value.copyWith(id: randomAlphaNumeric(16));
        await groceryModifier.add(copy);
        id = copy.id;
      } else {
        id = entry.value.id;
      }
      groceryMapping[entry.key] = id;
    }

    for (final recipe in currentState.importRecipe) {
      final fixedSteps = recipe.steps.map((step) {
        final fixedIngredients = step.ingredients.map((ingredient) {
          final originalGrocery =
              currentState.originalGrocery[ingredient.groceryId]!;
          final newGrocery =
              currentState.importGroceryLookup[ingredient.groceryId]!;

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
