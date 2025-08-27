import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_screen_notifier.g.dart';

@riverpod
Future<RecipeScreenState> recipeScreenNotifier(Ref ref) async {
  final recipes = await ref.watch(recipeNotifierProvider.future);
  final groceries = await ref.watch(groceryNotifierProvider.future);
  final timers = ref.watch(timerNotifierProvider);

  final quickFilters = ref.watch(quickFilterNotifierProvider);

  final onlyShowRunning = quickFilters[QuickFilters.running] ?? false;

  final recipeList = <RecipeData>[];
  bool synced = true;

  for (final recipe in recipes.values) {
    if (recipe.uploaded == false) {
      synced = false;
    }

    if (onlyShowRunning && timers.containsKey(recipe.id)) {
      recipeList.add(recipe);
    } else {
      recipeList.add(recipe);
    }
  }

  return RecipeScreenState(
    synced: synced,
    timers: timers.keys.toList(),
    recipe: recipeList,
    grocery: groceries,
  );
}

class RecipeScreenState {
  RecipeScreenState({
    required this.synced,
    required this.timers,
    required this.recipe,
    required this.grocery,
  });

  final bool synced;
  final List<String> timers;
  final List<RecipeData> recipe;
  final Map<String, GroceryData> grocery;
}
