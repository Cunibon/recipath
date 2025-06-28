import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredients_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';

part 'recipe_data.freezed.dart';
part 'recipe_data.g.dart';

@freezed
abstract class RecipeData with _$RecipeData {
  const factory RecipeData({
    required String id,
    required String title,
    String? imageName,
    required List<RecipeStepData> steps,
  }) = _RecipeData;

  factory RecipeData.fromJson(Map<String, Object?> json) =>
      _$RecipeDataFromJson(json);
}

extension RecipeDataFunctions on RecipeData {
  List<IngredientsData> getIngredients() {
    final Map<GroceryData, IngredientsData> ingredients = {};
    for (final step in steps) {
      for (final ingredient in step.ingredients) {
        final data = ingredients.putIfAbsent(
          ingredient.grocery,
          () => IngredientsData(
            id: randomAlphaNumeric(16),
            amount: 0,
            grocery: ingredient.grocery,
          ),
        );
        ingredients[ingredient.grocery] = data.copyWith(
          amount: data.amount + ingredient.amount,
        );
      }
    }
    return ingredients.values.toList();
  }
}
