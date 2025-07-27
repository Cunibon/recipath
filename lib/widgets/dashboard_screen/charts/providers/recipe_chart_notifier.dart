import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/chart_entry.dart';
import 'package:recipe_list/widgets/recipe_screen/providers/recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_chart_notifier.g.dart';

@riverpod
Future<ChartState> recipeChartNotifier(Ref ref, DateTimeRange dateRange) async {
  final recipeHistoyData = await ref
      .watch(recipeStatisticsRepoNotifierProvider)
      .getRecipeCountBetween(
        startDate: dateRange.start,
        endDate: dateRange.end,
      );
  final recipeHistoryList = recipeHistoyData.entries.toList();

  recipeHistoryList.sort((a, b) => -a.value.compareTo(b.value));

  final recipeMap = await ref.watch(recipeNotifierProvider.future);

  final chartEntries = <ChartEntry>[];
  int maxY = 0;

  for (int i = 0; i < recipeHistoryList.length; i++) {
    final entry = recipeHistoryList[i];

    final groupData = BarChartGroupData(
      x: i,
      showingTooltipIndicators: [0],
      barRods: [
        BarChartRodData(
          width: 30,
          toY: entry.value.toDouble(),
          color: getRandomColorBasedOnString(entry.key),
        ),
      ],
    );

    final recipe = recipeMap[entry.key]!;

    chartEntries.add(
      ChartEntry(
        identifier: entry.key,
        groupData: groupData,
        title: recipe.title,
        tooltip: entry.value.toString(),
      ),
    );

    if (entry.value > maxY) {
      maxY = entry.value;
    }
  }

  return ChartState(entries: chartEntries, maxY: maxY.toDouble());
}
