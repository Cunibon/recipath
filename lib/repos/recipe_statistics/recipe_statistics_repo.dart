import 'package:recipe_list/data/recipe_statistic_data.dart';
import 'package:recipe_list/repos/repo.dart';

abstract class RecipeStatisticsRepo extends Repo<RecipeStatisticData> {
  RecipeStatisticsRepo(super.db);

  Future<Duration?> getAverageTimeForRecipe(String recipeId);

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
