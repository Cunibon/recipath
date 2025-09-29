import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/average_recipe_time_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/filtered_recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_screen_notifier.g.dart';

@riverpod
Future<RecipeScreenState> recipeScreenNotifier(Ref ref) async {
  final recipes = await ref.watch(filteredRecipeProvider.future);
  final groceries = await ref.watch(groceryProvider.future);
  final timers = ref.watch(timerProvider);

  final quickFilters = ref.watch(quickFilterProvider);

  final onlyShowRunning = quickFilters[QuickFilters.running] ?? false;

  final recipeList = <CompactRecipeItemData>[];
  bool synced = true;

  for (final recipe in recipes.values) {
    if (recipe.uploaded == false) {
      synced = false;
    }
    final averageTime = await ref.watch(
      averageRecipeTimeProvider(recipe.id).future,
    );
    final tags = await ref.watch(
      tagsPerRecipeProvider.selectAsync((data) => data[recipe.id] ?? {}),
    );

    final compactRecipeData = CompactRecipeItemData(
      recipeData: recipe,
      averageTime: averageTime,
      groceryMap: groceries,
      tags: tags,
      timerData: timers[recipe.id],
    );

    if (onlyShowRunning) {
      if (timers.containsKey(recipe.id)) {
        recipeList.add(compactRecipeData);
      }
    } else {
      recipeList.add(compactRecipeData);
    }
  }

  return RecipeScreenState(
    synced: synced,
    recipe: recipeList,
    grocery: groceries,
  );
}

class RecipeScreenState {
  RecipeScreenState({
    required this.synced,
    required this.recipe,
    required this.grocery,
  });

  final bool synced;
  final List<CompactRecipeItemData> recipe;
  final Map<String, GroceryData> grocery;
}
