import 'package:recipath/application/recipe_modifier/recipe_modifier.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_modifier_notifier.g.dart';

@riverpod
RecipeModifier recipeModifierNotifier(Ref ref) {
  final repo = ref.watch(recipeRepoProvider);
  return RecipeModifier(repo);
}
