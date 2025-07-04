import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
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
  String toReadable(Map<String, GroceryData> groceries) {
    final stringBuffer = StringBuffer();

    stringBuffer.writeln(title);

    getIngredients(groceries).forEach(
      (ingredient) => stringBuffer.writeln(
        ingredient.toReadable(groceries[ingredient.groceryId]!),
      ),
    );

    return stringBuffer.toString();
  }

  List<IngredientData> getIngredients(Map<String, GroceryData> groceries) =>
      IngredientData.aggregateIngredients(
        groceries,
        steps.expand((e) => e.ingredients),
      );
}
