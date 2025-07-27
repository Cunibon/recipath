import 'package:drift/drift.dart';
import 'package:recipe_list/data/recipe_statistic_data.dart';
import 'package:recipe_list/drift/database.dart';

abstract class RecipeStatisticsRepo {
  RecipeStatisticsRepo(this.db);
  final AppDatabase db;

  ResultSetImplementation get table;

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

  Future<void> add(RecipeStatisticData newData);
  Future<void> delete(String id);
  Future<void> clear();
}
