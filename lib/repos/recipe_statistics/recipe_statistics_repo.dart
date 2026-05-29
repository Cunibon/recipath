import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

abstract class RecipeStatisticsRepo extends LocalRepo<RecipeStatisticData> {
  RecipeStatisticsRepo(super.db);

  Future<IMap<String, RecipeStatisticData>> getForId(String recipeId);

  Stream<Duration?> getAverageTimeForRecipe(String recipeId);

  Future<IMap<String, int>> getRecipeCountBetween({
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<Map<String, Map<String, Map<String, double>>>> getGroceryAmountBetween({
    required DateTime startDate,
    required DateTime endDate,
  });
}
