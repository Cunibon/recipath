import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_screen_notifier.g.dart';

@riverpod
Future<RecipeScreenState> recipeScreenNotifier(Ref ref) async {
  final recipes = await ref.watch(recipeNotifierProvider.future);
  final groceries = await ref.watch(groceryNotifierProvider.future);
  final timers = ref.watch(timerNotifierProvider);

  bool synced = true;

  for (final recipe in recipes.values) {
    if (recipe.uploaded == false) {
      synced = false;
    }
  }

  return RecipeScreenState(
    synced: synced,
    timers: timers.keys.toList(),
    recipe: recipes,
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
  final Map<String, RecipeData> recipe;
  final Map<String, GroceryData> grocery;
}
