import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/chart_entry.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_chart_notifier.g.dart';

@riverpod
Future<ChartState> groceryChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
) async {
  final groceryHistoyData = await ref
      .watch(recipeStatisticsRepoNotifierProvider)
      .getGroceryAmountBetween(
        startDate: dateRange.start,
        endDate: dateRange.end,
      );
  final groceryHistoryList = groceryHistoyData.entries.toList();

  groceryHistoryList.sort((a, b) => -a.value.compareTo(b.value));

  final groceryMap = await ref.watch(groceryNotifierProvider.future);

  final chartEntries = <ChartEntry>[];
  double maxY = 0;

  for (int i = 0; i < groceryHistoryList.length; i++) {
    final entry = groceryHistoryList[i];

    final groupData = BarChartGroupData(
      x: i,
      showingTooltipIndicators: [0],
      barRods: [
        BarChartRodData(
          width: 30,
          toY: entry.value,
          gradient: LinearGradient(
            colors: [Colors.purple[900]!, Colors.purple[400]!],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ],
    );

    final grocery = groceryMap[entry.key]!;

    chartEntries.add(
      ChartEntry(
        groupData: groupData,
        title: grocery.name,
        tooltip: "${entry.value}${grocery.unit.name}",
      ),
    );

    if (entry.value > maxY) {
      maxY = entry.value;
    }
  }

  return ChartState(entries: chartEntries, maxY: maxY);
}
