import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recipath/common.dart';
import 'package:recipath/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/chart_entry.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/recipe_chart/providers/recipe_statistics_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_chart_notifier.g.dart';

@riverpod
Future<ChartState> recipeChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
  Set<String> selectedRecipes,
) async {
  final recipeHistoyData = await ref.watch(
    recipeChartStatisticsProvider(dateRange).future,
  );
  final recipeHistoryList = recipeHistoyData.entries.toList();

  recipeHistoryList.sort((a, b) => -a.value.compareTo(b.value));

  final recipeMap = await ref.watch(fullRecipeRepoProvider).get();

  final chartEntries = <ChartEntry>[];
  int maxY = 0;

  for (int i = 0; i < recipeHistoryList.length; i++) {
    final entry = recipeHistoryList[i];

    Color color = getRandomColorBasedOnString(entry.key);

    if (selectedRecipes.isNotEmpty && !selectedRecipes.contains(entry.key)) {
      color = color.withAlpha(128);
    }

    final groupData = BarChartGroupData(
      x: i,
      showingTooltipIndicators: [0],
      barRods: [
        BarChartRodData(width: 30, toY: entry.value.toDouble(), color: color),
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
