import 'package:recipath/application/recipe_statistics_modifier%20copy/recipe_statistics_modifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_statistics_modifier_notifier.g.dart';

@riverpod
RecipeStatisticsModifier recipeStatisticsModifierNotifier(Ref ref) {
  final repo = ref.watch(recipeStatisticsRepoProvider);
  return RecipeStatisticsModifier(repo);
}
