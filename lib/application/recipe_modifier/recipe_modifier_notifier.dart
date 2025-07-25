import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/recipe_modifier/recipe_modifier.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_modifier_notifier.g.dart';

@riverpod
RecipeModifier recipeModifierNotifier(Ref ref) {
  final repo = ref.watch(recipeRepoNotifierProvider);
  return RecipeModifier(repo);
}
