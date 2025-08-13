import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/drift/database.dart';

part 'recipe_statistic_data.freezed.dart';
part 'recipe_statistic_data.g.dart';

@freezed
abstract class RecipeStatisticData with _$RecipeStatisticData {
  const factory RecipeStatisticData({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    required String recipeId,
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
        uploaded: data.uploaded,
      );

  factory RecipeStatisticData.fromSupabase(Map<String, dynamic> data) =>
      RecipeStatisticData(
        id: data["id"],
        startDate: DateTime.fromMillisecondsSinceEpoch(data["start_date"]),
        endDate: DateTime.fromMillisecondsSinceEpoch(data["end_date"]),
        recipeId: data["recipe_id"],
        uploaded: true,
      );
}

extension RecipeStatisticDataFunctions on RecipeStatisticData {
  RecipeStatisticTableCompanion toTableCompanion() =>
      RecipeStatisticTableCompanion.insert(
        id: id,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
        recipeId: recipeId,
        uploaded: drift.Value(uploaded),
      );

  Map<String, dynamic> toSupabase() => {
    "id": id,
    "start_date": startDate.millisecondsSinceEpoch,
    "end_date": endDate.millisecondsSinceEpoch,
    "recipe_id": recipeId,
  };
}
