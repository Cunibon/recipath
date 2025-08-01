import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/recipe_shopping_modifier/recipe_shopping_modifier.dart';
import 'package:recipe_list/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_modifier_notifier.g.dart';

@riverpod
RecipeShoppingModifier recipeShoppingModifierNotifier(Ref ref) {
  final repo = ref.watch(recipeShoppingRepoNotifierProvider);
  return RecipeShoppingModifier(repo);
}
