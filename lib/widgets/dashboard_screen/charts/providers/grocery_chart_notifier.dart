import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
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
  final groceryMap = await ref.watch(groceryNotifierProvider.future);

  final Map<GroceryData, double> normalizedData = {};

  groceryHistoyData.forEach((key, value) {
    final grocery = groceryMap[key];

    if (grocery != null) {
      double aggregated = 0;

      value.forEach((key, value) {
        aggregated += grocery.convertToNorm(
          value,
          GroceryData.jsonStringToEnum(key),
        );
      });
      normalizedData[grocery] = aggregated;
    }
  });

  final groceryHistoryList = normalizedData.entries.toList();
  groceryHistoryList.sort((a, b) => -a.value.compareTo(b.value));

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

    chartEntries.add(
      ChartEntry(
        groupData: groupData,
        title: entry.key.name,
        tooltip:
            "${doubleNumberFormat.format(entry.value)}${entry.key.unit.name}",
      ),
    );

    if (entry.value > maxY) {
      maxY = entry.value;
    }
  }

  return ChartState(entries: chartEntries, maxY: maxY);
}
