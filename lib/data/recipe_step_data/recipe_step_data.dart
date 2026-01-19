import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/drift/database.dart';

part 'recipe_step_data.freezed.dart';
part 'recipe_step_data.g.dart';

@freezed
abstract class RecipeStepData with _$RecipeStepData {
  const factory RecipeStepData({
    required String id,
    required String description,
    required List<IngredientData> ingredients,
    required int? minutes,
  }) = _RecipeStepData;

  factory RecipeStepData.fromJson(Map<String, Object?> json) =>
      _$RecipeStepDataFromJson(json);

  factory RecipeStepData.fromTable(RecipeStepTableData data) => RecipeStepData(
    id: data.id,
    description: data.description,
    ingredients: [],
    minutes: data.minutes,
  );

  factory RecipeStepData.fromSupabase(
    Map<String, dynamic> data,
    List<IngredientData> ingredients,
  ) => RecipeStepData(
    id: data["id"],
    description: data["description"],
    ingredients: ingredients,
    minutes: data["minutes"],
  );
}

extension RecipeStepDataFunctions on RecipeStepData {
  Map<String, dynamic> toSupabase(String recipeId, int index) => {
    "id": id,
    "description": description,
    "index": index,
    "recipe_id": recipeId,
    "minutes": minutes,
  };
}
