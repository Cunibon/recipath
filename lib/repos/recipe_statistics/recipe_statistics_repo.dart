import 'package:recipath/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipath/repos/sync_repo.dart';

abstract class RecipeStatisticsRepo extends SyncRepo<RecipeStatisticData> {
  RecipeStatisticsRepo(super.db);

  Future<Map<String, RecipeStatisticData>> getForId(String recipeId);

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
