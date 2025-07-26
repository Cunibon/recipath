import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/drift/database.dart';

part 'recipe_statistic_data.freezed.dart';
part 'recipe_statistic_data.g.dart';

@freezed
abstract class RecipeStatisticData with _$RecipeStatisticData {
  const factory RecipeStatisticData({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    required RecipeData recipeData,
  }) = _RecipeStatisticData;

  factory RecipeStatisticData.fromJson(Map<String, Object?> json) =>
      _$RecipeStatisticDataFromJson(json);
}

extension RecipeStatisticDataFunctions on RecipeStatisticData {
  RecipeStatisticTableCompanion toTableCompanion() =>
      RecipeStatisticTableCompanion.insert(
        id: id,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
        recipeId: recipeData.id,
      );
}
