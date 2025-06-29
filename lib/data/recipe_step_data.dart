import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_step_data.freezed.dart';
part 'recipe_step_data.g.dart';

@freezed
abstract class RecipeStepData with _$RecipeStepData {
  const factory RecipeStepData({
    required String id,
    required String description,
    required List<String> ingredientIds,
  }) = _RecipeStepData;

  factory RecipeStepData.fromJson(Map<String, Object?> json) =>
      _$RecipeStepDataFromJson(json);
}
