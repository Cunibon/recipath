import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
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
  String? recipeId,
) async {
  final groceryMap = await ref.watch(groceryNotifierProvider.future);
  final groceryStatisticsData = await ref.watch(
    groceryChartStatisticsNotifierProvider(dateRange).future,
  );

  final nutrients = <String, double? Function(GroceryData)>{
    'kcal': (g) => g.kcal,
    'fat': (g) => g.fat,
    'carbs': (g) => g.carbs,
    'protein': (g) => g.protein,
    'fiber': (g) => g.fiber,
  };

  final nutrimentsMap = ref.watch(nutrimentColorNotifierProvider);

  final aggregated = <GroceryData, Map<String, double>>{};

  void aggregateForRecipe(
    String recipeKey,
    Map<String, Map<String, double>> rawData,
  ) {
    for (final entry in rawData.entries) {
      final grocery = groceryMap[entry.key];
      if (grocery == null) continue;

      final unitType = UnitConversion.unitType(grocery.unit);

      for (final nutrient in nutrients.entries) {
        final nutrientValue = nutrient.value(grocery);
        if (nutrientValue == null) continue;

        final total = entry.value.entries.fold<double>(0, (sum, e) {
          final gramValue = grocery.convertToGram(
            e.value,
            GroceryData.jsonStringToEnum(e.key),
          );

          final additiveValue = unitType == UnitType.misc
              ? gramValue
              : gramValue / 100;

          return sum + additiveValue * nutrientValue;
        });

        aggregated.putIfAbsent(grocery, () => {});
        aggregated[grocery]![nutrient.key] =
            (aggregated[grocery]![nutrient.key] ?? 0) + total;
      }
    }
  }

  if (recipeId == null) {
    groceryStatisticsData.forEach(
      (recipeKey, recipeData) => aggregateForRecipe(recipeKey, recipeData),
    );
  } else {
    final data = groceryStatisticsData[recipeId];
    if (data != null) {
      aggregateForRecipe(recipeId, data);
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

    for (final nutrientKey in nutrients.keys) {
      final value = nutrientMap[nutrientKey];
      if (value == null || value == 0) {
        continue;
      }

      barRods.add(
        BarChartRodData(
          toY: value,
          width: 20,
          color: nutrimentsMap[nutrientKey],
          borderRadius: BorderRadius.zero,
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
