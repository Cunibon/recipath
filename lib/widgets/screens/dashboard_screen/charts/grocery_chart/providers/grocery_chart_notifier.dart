import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/chart_entry.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/grocery_chart/providers/grocery_statistics_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_chart_notifier.g.dart';

@riverpod
Future<ChartState> groceryChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
  Set<String> selectedRecipes,
) async {
  final groceryMap = await ref.watch(groceryNotifierProvider.future);
  final groceryStatisticsData = await ref.watch(
    groceryChartStatisticsNotifierProvider(dateRange).future,
  );

  final aggregatedData = <GroceryData, double>{};
  final rodStackItems = <GroceryData, List<BarChartRodStackItem>>{};

  void aggregateForRecipe(
    String recipeKey,
    Map<String, Map<String, double>> rawData,
  ) {
    for (final entry in rawData.entries) {
      final grocery = groceryMap[entry.key];
      if (grocery == null) continue;

      final total = entry.value.entries.fold<double>(0, (sum, e) {
        return sum +
            grocery.convertToGram(e.value, GroceryData.jsonStringToEnum(e.key));
      });

      aggregatedData[grocery] = (aggregatedData[grocery] ?? 0) + total;

      final stack = rodStackItems.putIfAbsent(grocery, () => []);
      final fromY = stack.isEmpty ? 0.0 : stack.last.toY;
      stack.add(
        BarChartRodStackItem(
          fromY,
          fromY + total,
          getRandomColorBasedOnString(recipeKey),
        ),
      );
    }
  }

  if (selectedRecipes.isEmpty) {
    groceryStatisticsData.forEach(
      (recipeKey, recipeData) => aggregateForRecipe(recipeKey, recipeData),
    );
  } else {
    for (final recipeId in selectedRecipes) {
      final data = groceryStatisticsData[recipeId];
      if (data != null) {
        aggregateForRecipe(recipeId, data);
      }
    }
  }

  final sortedEntries = aggregatedData.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  double maxY = 0;
  final chartEntries = <ChartEntry>[];

  final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

  for (int i = 0; i < sortedEntries.length; i++) {
    final entry = sortedEntries[i];
    final rods = rodStackItems[entry.key]!;

    chartEntries.add(
      ChartEntry(
        groupData: BarChartGroupData(
          x: i,
          showingTooltipIndicators: const [0],
          barRods: [
            BarChartRodData(
              toY: entry.value,
              width: 30,
              color: Colors.transparent,
              rodStackItems: rods,
            ),
          ],
        ),
        title: entry.key.name,
        tooltip: "${doubleNumberFormat.format(entry.value)}${UnitEnum.g.name}",
      ),
    );

    if (entry.value > maxY) maxY = entry.value;
  }

  return ChartState(entries: chartEntries, maxY: maxY);
}
