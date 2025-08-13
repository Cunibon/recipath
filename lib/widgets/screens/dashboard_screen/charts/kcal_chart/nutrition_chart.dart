import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/kcal_chart/nutrition_legend.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/kcal_chart/providers/nutrition_chart_notifier.dart';

class NutritionChart extends ConsumerWidget {
  const NutritionChart({
    required this.dateRange,
    required this.selectedRecipes,
    super.key,
  });

  final DateTimeRange dateRange;
  final List<String> selectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      nutritionChartNotifierProvider(dateRange, selectedRecipes),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Nutriments", style: Theme.of(context).textTheme.titleLarge),
        Divider(),
        AsyncChart(
          asyncState: state,
          builder: (data) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseChart(
                axisSpace: 150,
                state: data,
                horizontalInterval: 500,
                horizontalTitleInterval: 1000,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) => Colors.black.withAlpha(128),
                  tooltipPadding: EdgeInsets.symmetric(horizontal: 2),
                  tooltipMargin: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final value = rod.toY;
                    return BarTooltipItem(
                      doubleNumberFormat.format(value),
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              NutritionLegend(data: data),
            ],
          ),
        ),
      ],
    );
  }
}
