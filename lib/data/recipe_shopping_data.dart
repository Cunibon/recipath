import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/drift/database.dart';

part 'recipe_shopping_data.freezed.dart';
part 'recipe_shopping_data.g.dart';

@freezed
abstract class RecipeShoppingData with _$RecipeShoppingData {
  const factory RecipeShoppingData({
    required String id,
    required DateTime date,
    required String recipeId,
  }) = _RecipeShoppingData;

  factory RecipeShoppingData.fromJson(Map<String, Object?> json) =>
      _$RecipeShoppingDataFromJson(json);

  factory RecipeShoppingData.fromTableData(RecipeShoppingTableData data) =>
      RecipeShoppingData(
        id: data.id,
        date: DateTime.fromMillisecondsSinceEpoch(data.date),
        recipeId: data.recipeId,
      );

  factory RecipeShoppingData.fromRecipe(RecipeData data) => RecipeShoppingData(
    id: randomAlphaNumeric(16),
    date: DateTime.now(),
    recipeId: data.id,
  );
}

extension RecipeShoppingDataFunctions on RecipeShoppingData {
  RecipeShoppingTableCompanion toTableCompanion() =>
      RecipeShoppingTableCompanion.insert(
        id: id,
        date: date.millisecondsSinceEpoch,
        recipeId: recipeId,
      );
}
