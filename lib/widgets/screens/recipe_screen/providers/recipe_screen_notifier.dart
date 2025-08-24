import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_screen_notifier.g.dart';

@riverpod
Future<RecipeScreenState> recipeScreenNotifier(Ref ref) async =>
    RecipeScreenState(
      recipe: await ref.watch(recipeNotifierProvider.future),
      grocery: await ref.watch(groceryNotifierProvider.future),
    );

class RecipeScreenState {
  RecipeScreenState({required this.recipe, required this.grocery});

  final Map<String, RecipeData> recipe;
  final Map<String, GroceryData> grocery;
}
