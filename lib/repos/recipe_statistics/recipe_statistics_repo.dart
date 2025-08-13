import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/repos/sync_repo.dart';

abstract class RecipeStatisticsRepo extends SyncRepo<RecipeStatisticData> {
  RecipeStatisticsRepo(super.db);

  Stream<Duration?> getAverageTimeForRecipe(String recipeId);

  Future<Map<String, int>> getRecipeCountBetween({
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<Map<String, Map<String, Map<String, double>>>>
  getGroceryAmountBetween({
    required DateTime startDate,
    required DateTime endDate,
  });
}
