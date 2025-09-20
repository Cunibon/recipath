import 'package:flutter/material.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_statistics_notifier.g.dart';

@riverpod
Future<Map<String, int>> recipeChartStatisticsNotifier(
  Ref ref,
  DateTimeRange dateRange,
) => ref
    .watch(recipeStatisticsRepoProvider)
    .getRecipeCountBetween(startDate: dateRange.start, endDate: dateRange.end);
