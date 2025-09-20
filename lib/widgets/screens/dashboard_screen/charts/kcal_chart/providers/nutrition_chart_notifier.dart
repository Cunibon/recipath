import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/chart_entry.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/grocery_chart/providers/grocery_statistics_notifier.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/kcal_chart/providers/nutriment_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutrition_chart_notifier.g.dart';

@riverpod
Future<ChartState> nutritionChartNotifier(
  Ref ref,
  DateTimeRange dateRange,
  Set<String> selectedRecipes,
) async {
  final groceryMap = await ref.watch(groceryProvider.future);
  final groceryStatisticsData = await ref.watch(
    groceryChartStatisticsProvider(dateRange).future,
  );

  final aggregated = <GroceryData, Map<Nutriments, double>>{};

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
      final aKcal = a.value[Nutriments.kcal] ?? 0;
      final bKcal = b.value[Nutriments.kcal] ?? 0;
      return bKcal.compareTo(aKcal);
    });

  double maxY = 0;
  final chartEntries = <ChartEntry>[];

  for (int i = 0; i < sortedGroceries.length; i++) {
    final grocery = sortedGroceries[i].key;
    final nutrientMap = sortedGroceries[i].value;

    final barRods = <BarChartRodData>[];

    for (final nutriment in Nutriments.values) {
      final value = nutrientMap[nutriment] ?? 0;

      barRods.add(
        BarChartRodData(toY: value, width: 20, color: nutriment.color),
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
