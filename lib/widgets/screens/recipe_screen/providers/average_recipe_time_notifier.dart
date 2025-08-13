import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'average_recipe_time_notifier.g.dart';

@riverpod
Stream<Duration?> averageRecipeTimeNotifier(Ref ref, String recipeId) => ref
    .watch(recipeStatisticsRepoNotifierProvider)
    .getAverageTimeForRecipe(recipeId);
