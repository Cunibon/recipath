import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/chart_entry.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/recipe_chart/providers/recipe_statistics_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/providers/recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_chart_notifier.g.dart';

@riverpod
Future<ChartState> recipeChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
  String? recipeId,
) async {
  final recipeHistoyData = await ref.watch(
    recipeChartStatisticsNotifierProvider(dateRange).future,
  );
  final recipeHistoryList = recipeHistoyData.entries.toList();

  recipeHistoryList.sort((a, b) => -a.value.compareTo(b.value));

  final recipeMap = await ref.watch(recipeNotifierProvider.future);

  final chartEntries = <ChartEntry>[];
  int maxY = 0;

  for (int i = 0; i < recipeHistoryList.length; i++) {
    final entry = recipeHistoryList[i];

    Color color = getRandomColorBasedOnString(entry.key);

    if (recipeId != null && entry.key != recipeId) {
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
