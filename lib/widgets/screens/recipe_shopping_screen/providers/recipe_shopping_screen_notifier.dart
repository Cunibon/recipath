import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipe_list/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipe_list/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_screen_notifier.g.dart';

@riverpod
Future<List<({RecipeShoppingData shoppingData, RecipeData recipe})>>
recipeShoppingScreenNotifier(Ref ref) async {
  final recipeMap = await ref.watch(fullRecipeRepoNotifierProvider).get();
  final recipeStatisticsList = await ref
      .watch(recipeShoppingRepoNotifierProvider)
      .get();
  return recipeStatisticsList.values
      .map((e) => (shoppingData: e, recipe: recipeMap[e.recipeId]!))
      .toList();
}
