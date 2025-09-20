import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_screen_notifier.g.dart';

@riverpod
Future<RecipeScreenState> recipeScreenNotifier(Ref ref) async {
  final recipes = await ref.watch(recipeProvider.future);
  final groceries = await ref.watch(groceryProvider.future);
  final timers = ref.watch(timerProvider);

  final quickFilters = ref.watch(quickFilterProvider);

  final onlyShowRunning = quickFilters[QuickFilters.running] ?? false;

  final recipeList = <RecipeData>[];
  bool synced = true;

  for (final recipe in recipes.values) {
    if (recipe.uploaded == false) {
      synced = false;
    }

    if (onlyShowRunning) {
      if (timers.containsKey(recipe.id)) {
        recipeList.add(recipe);
      }
    } else {
      recipeList.add(recipe);
    }
  }

  return RecipeScreenState(
    synced: synced,
    timerData: timers,
    recipe: recipeList,
    grocery: groceries,
  );
}

class RecipeScreenState {
  RecipeScreenState({
    required this.synced,
    required this.timerData,
    required this.recipe,
    required this.grocery,
  });

  final bool synced;
  final Map<String, TimerData> timerData;
  final List<RecipeData> recipe;
  final Map<String, GroceryData> grocery;
}
