import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/recipe_step_data.dart';

part 'recipe_statistic_data.freezed.dart';
part 'recipe_statistic_data.g.dart';

@freezed
abstract class RecipeStatisticData with _$RecipeStatisticData {
  const factory RecipeStatisticData({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    required RecipeStepData data,
  }) = _RecipeStatisticData;

  factory RecipeStatisticData.fromJson(Map<String, Object?> json) =>
      _$RecipeStatisticDataFromJson(json);
}
