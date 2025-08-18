import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_statistics_notifier.g.dart';

@riverpod
Future<Map<String, Map<String, Map<String, double>>>>
groceryChartStatisticsNotifier(Ref ref, DateTimeRange dateRange) => ref
    .watch(recipeStatisticsRepoNotifierProvider)
    .getGroceryAmountBetween(
      startDate: dateRange.start,
      endDate: dateRange.end,
    );
