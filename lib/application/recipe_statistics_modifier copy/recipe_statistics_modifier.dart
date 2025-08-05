import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo.dart';

class RecipeStatisticsModifier {
  RecipeStatisticsModifier(this.repo);
  final RecipeStatisticsRepo repo;

  Future<void> add(RecipeStatisticData newData) => repo.add(newData);
  Future<void> delete(RecipeStatisticData toDelete) => repo.delete(toDelete.id);

  Future<void> clear() => repo.clear();
}
