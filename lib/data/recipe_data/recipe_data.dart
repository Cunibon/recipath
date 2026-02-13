import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/drift/database.dart';

part 'recipe_data.freezed.dart';
part 'recipe_data.g.dart';

@freezed
abstract class RecipeData with _$RecipeData {
  const factory RecipeData({
    required String id,
    String? parent,
    required String title,
    int? servings,
    String? imageName,
    required List<RecipeStepData> steps,
    @Default(false) bool archived,
    @Default(false) uploaded,
  }) = _RecipeData;

  factory RecipeData.fromJson(Map<String, Object?> json) =>
      _$RecipeDataFromJson(json);

  factory RecipeData.fromTableData(RecipeTableData data) => RecipeData(
    id: data.id,
    parent: data.parent,
    title: data.title,
    servings: data.servings,
    imageName: data.imageName,
    archived: data.archived,
    steps: [],
    uploaded: data.uploaded,
  );
}

extension RecipeDataFunctions on RecipeData {
  String toReadable({
    required Map<String, GroceryData> groceries,
    required Map<UnitEnum, String> unitLocalized,
    required NumberFormat doubleNumberFormat,
  }) {
    final stringBuffer = StringBuffer();

    stringBuffer.writeln(title);

    getIngredients(groceries).forEach(
      (ingredient) => stringBuffer.writeln(
        ingredient.toReadable(
          grocery: groceries[ingredient.groceryId]!,
          unitLocalized: unitLocalized,
          doubleNumberFormat: doubleNumberFormat,
        ),
      ),
    );

    return stringBuffer.toString();
  }

  RecipeData copyWithNewId({Map<String, String> groceryLookup = const {}}) {
    return copyWith(
      id: randomAlphaNumeric(16),
      steps: steps
          .map(
            (step) => step.copyWith(
              id: randomAlphaNumeric(16),
              ingredients: step.ingredients
                  .map(
                    (ingredient) => ingredient.copyWith(
                      id: randomAlphaNumeric(16),
                      groceryId:
                          groceryLookup[ingredient.groceryId] ??
                          ingredient.groceryId,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  RecipeData adjustIngredientForPlannedServings(int? plannedServings) {
    if (servings == null || plannedServings == null) return this;
    final ratio = plannedServings / servings!;
    return copyWith(
      servings: plannedServings,
      steps: steps
          .map(
            (step) => step.copyWith(
              ingredients: step.ingredients
                  .map(
                    (ingredient) =>
                        ingredient.copyWith(amount: ingredient.amount * ratio),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  Set<IngredientData> diffIngredients(RecipeData other) {
    final ingredients = steps.expand((step) => step.ingredients).toSet();
    final otherIngredients = other.steps
        .expand((step) => step.ingredients)
        .toSet();
    return ingredients.difference(otherIngredients);
  }

  List<IngredientData> getIngredients(Map<String, GroceryData> groceries) =>
      IngredientData.aggregateIngredients(
        groceries,
        steps.expand((e) => e.ingredients),
      );
}
