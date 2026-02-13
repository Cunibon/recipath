import 'package:recipath/data/recipe_data/recipe_data.dart';

class HistoryData {
  HistoryData({
    required this.startDate,
    this.endDate,
    required this.recipeData,
  });

  final DateTime startDate;
  final DateTime? endDate;
  final RecipeData recipeData;
}
