import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier.dart';
import 'package:recipath/repos/recipe_tag/recipe_tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_tag_modifier_notifier.g.dart';

@riverpod
RecipeTagModifier recipeTagModifierNotifier(Ref ref) {
  final repo = ref.watch(recipeTagRepoProvider);
  return RecipeTagModifier(repo);
}
