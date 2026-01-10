import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_import_screen_notifier.g.dart';

@riverpod
class GroceryImportScreenNotifier extends _$GroceryImportScreenNotifier {
  @override
  Future<Map<String, GroceryData>> build(String path) async {
    final recipeImportState = await ref.watch(
      recipeImportScreenProvider(path).future,
    );

    final localGroceryNameLookup = (await ref.watch(
      groceryProvider.future,
    )).map((key, value) => MapEntry(value.name.trim().toLowerCase(), value));

    final groceryIds = recipeImportState.importRecipe
        .expand(
          (element) =>
              element.getIngredients(recipeImportState.originalGrocery),
        )
        .map((e) => e.groceryId)
        .toSet();
    final groceries = <String, GroceryData>{};

    for (final groceryId in groceryIds) {
      if (recipeImportState.originalGrocery.containsKey(groceryId)) {
        final importGrocery = recipeImportState.originalGrocery[groceryId]!;
        groceries[groceryId] =
            localGroceryNameLookup[importGrocery.name.trim().toLowerCase()] ??
            importGrocery;
      }
    }

    return groceries;
  }

  void selectGrocery(String origin, GroceryData groceryData) {
    final currentState = state.value!;
    final currentLookup = Map<String, GroceryData>.from(currentState);

    state = AsyncValue.data(currentLookup..[origin] = groceryData);
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
    final recipeImportState = await ref.read(
      recipeImportScreenProvider(path).future,
    );

    final groceryMapping = <String, String>{};

    for (final entry in currentState.entries) {
      late String id;

      if (recipeImportState.originalGrocery.containsKey(entry.value.id)) {
        final copy = entry.value.copyWith(id: randomAlphaNumeric(16));
        await groceryModifier.add(copy);
        id = copy.id;
      } else {
        id = entry.value.id;
      }
      groceryMapping[entry.key] = id;
    }

    for (final recipe in recipeImportState.importRecipe) {
      final fixedSteps = recipe.steps.map((step) {
        final fixedIngredients = step.ingredients.map((ingredient) {
          final originalGrocery =
              recipeImportState.originalGrocery[ingredient.groceryId]!;
          final newGrocery = currentState[ingredient.groceryId]!;

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
