import 'package:recipe_list/data/recipe_data/recipe_data.dart';

class HistoryData {
  HistoryData({required this.date, required this.recipeData});

  final DateTime date;
  final RecipeData recipeData;
}
