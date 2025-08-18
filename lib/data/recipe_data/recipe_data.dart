import 'package:freezed_annotation/freezed_annotation.dart';
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
    title: data.title,
    servings: data.servings,
    imageName: data.imageName,
    archived: data.archived,
    steps: [],
    uploaded: data.uploaded,
  );

  factory RecipeData.fromSupabase(
    Map<String, dynamic> data,
    List<RecipeStepData> steps,
  ) => RecipeData(
    id: data["id"],
    title: data["title"],
    servings: data["servings"],
    imageName: data["image_name"],
    archived: data["archived"],
    steps: steps,
    uploaded: true,
  );
}

extension RecipeDataFunctions on RecipeData {
  String toReadable(
    Map<String, GroceryData> groceries,
    Map<UnitEnum, String> unitLocalized,
  ) {
    final stringBuffer = StringBuffer();

    stringBuffer.writeln(title);

    getIngredients(groceries).forEach(
      (ingredient) => stringBuffer.writeln(
        ingredient.toReadable(groceries[ingredient.groceryId]!, unitLocalized),
      ),
    );

    return stringBuffer.toString();
  }

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "title": title,
    "servings": servings,
    "image_name": imageName,
    "archived": archived,
  };

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
