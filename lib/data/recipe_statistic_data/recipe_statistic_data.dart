import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/common.dart';
import 'package:recipath/drift/database.dart';

part 'recipe_statistic_data.freezed.dart';
part 'recipe_statistic_data.g.dart';

@freezed
abstract class RecipeStatisticData with _$RecipeStatisticData {
  const factory RecipeStatisticData({
    required String id,
    @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
    required DateTime startDate,
    @JsonKey(fromJson: dateTimeFromMillis, toJson: dateTimeToMillis)
    required DateTime endDate,
    required String recipeId,
    required int? servings,
    @Default(false) bool uploaded,
  }) = _RecipeStatisticData;

  factory RecipeStatisticData.fromJson(Map<String, Object?> json) =>
      _$RecipeStatisticDataFromJson(json);

  factory RecipeStatisticData.fromTableData(RecipeStatisticTableData data) =>
      RecipeStatisticData(
        id: data.id,
        startDate: DateTime.fromMillisecondsSinceEpoch(data.startDate),
        endDate: DateTime.fromMillisecondsSinceEpoch(data.endDate),
        recipeId: data.recipeId,
        servings: data.servings,
        uploaded: data.uploaded,
      );
}

extension RecipeStatisticDataFunctions on RecipeStatisticData {
  RecipeStatisticTableCompanion toTableCompanion() =>
      RecipeStatisticTableCompanion.insert(
        id: id,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
        recipeId: recipeId,
        servings: drift.Value(servings),
        uploaded: drift.Value(uploaded),
      );
}
