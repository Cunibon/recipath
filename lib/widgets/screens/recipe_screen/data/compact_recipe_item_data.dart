import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';

class CompactRecipeItemData {
  CompactRecipeItemData({
    required this.recipeData,
    required this.averageTime,
    required this.groceryMap,
    required this.tags,
    this.timerData,
  });

  final RecipeData recipeData;
  final Duration? averageTime;
  final Map<String, GroceryData> groceryMap;
  final Set<TagData> tags;

  final TimerData? timerData;
}
