import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_history_screen_notifier.g.dart';

@riverpod
Future<List<({RecipeStatisticData statistics, RecipeData recipe})>>
recipeHistoryScreenNotifier(Ref ref) async {
  final recipeMap = await ref.watch(fullRecipeRepoNotifierProvider).get();
  final recipeStatisticsList = await ref
      .watch(recipeStatisticsRepoNotifierProvider)
      .get();
  return recipeStatisticsList.values
      .map((e) => (statistics: e, recipe: recipeMap[e.recipeId]!))
      .toList();
}
