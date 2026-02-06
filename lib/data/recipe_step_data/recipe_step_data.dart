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
}
