import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_statistics_notifier.g.dart';

@riverpod
Future<Map<String, int>> recipeChartStatisticsNotifier(
  Ref ref,
  DateTimeRange dateRange,
) => ref
    .watch(recipeStatisticsRepoNotifierProvider)
    .getRecipeCountBetween(startDate: dateRange.start, endDate: dateRange.end);
