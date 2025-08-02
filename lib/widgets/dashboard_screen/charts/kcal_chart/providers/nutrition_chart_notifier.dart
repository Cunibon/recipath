import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/chart_entry.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/grocery_chart/providers/grocery_statistics_notifier.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/kcal_chart/providers/nutrient_color_notifier.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutrition_chart_notifier.g.dart';

@riverpod
Future<ChartState> nutritionChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
  List<String> selectedRecipes,
) async {
  final groceryMap = await ref.watch(groceryNotifierProvider.future);
  final groceryStatisticsData = await ref.watch(
    groceryChartStatisticsNotifierProvider(dateRange).future,
  );

  final nutrimentsColorMap = ref.watch(nutrimentColorNotifierProvider);

  final aggregated = <GroceryData, Map<String, double>>{};

  void aggregateForRecipe(
    String recipeKey,
    Map<String, Map<String, double>> rawData,
  ) {
    for (final entry in rawData.entries) {
      final grocery = groceryMap[entry.key];
      if (grocery == null) continue;

      final groceryNutrients = grocery.getNutrients();

      for (final nutrient in groceryNutrients.entries) {
        if (nutrient.value == null) continue;

        final total = entry.value.entries.fold<double>(0, (sum, e) {
          final gramValue = grocery.convertToGram(
            e.value,
            GroceryData.jsonStringToEnum(e.key),
          );

          final additiveValue = gramValue / 100;

          return sum + additiveValue * nutrient.value!;
        });

        aggregated.putIfAbsent(grocery, () => {});
        aggregated[grocery]![nutrient.key] =
            (aggregated[grocery]![nutrient.key] ?? 0) + total;
      }
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

  final sortedGroceries = aggregated.entries.toList()
    ..sort((a, b) {
      final aKcal = a.value['kcal'] ?? 0;
      final bKcal = b.value['kcal'] ?? 0;
      return bKcal.compareTo(aKcal);
    });

  double maxY = 0;
  final chartEntries = <ChartEntry>[];

  for (int i = 0; i < sortedGroceries.length; i++) {
    final grocery = sortedGroceries[i].key;
    final nutrientMap = sortedGroceries[i].value;

    final barRods = <BarChartRodData>[];

    for (final nutrientKey in nutrimentsColorMap.keys) {
      final value = nutrientMap[nutrientKey] ?? 0;

      barRods.add(
        BarChartRodData(
          toY: value,
          width: 20,
          color: nutrimentsColorMap[nutrientKey],
        ),
      );

      if (value > maxY) maxY = value;
    }

    chartEntries.add(
      ChartEntry(
        groupData: BarChartGroupData(
          x: i,
          barRods: barRods,
          barsSpace: 4,
          showingTooltipIndicators: List.generate(barRods.length, (i) => i),
        ),
        title: grocery.name,
        tooltip: '',
      ),
    );
  }

  return ChartState(entries: chartEntries, maxY: maxY);
}
