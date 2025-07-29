import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/kcal_chart/providers/kcal_chart_notifier.dart';

class KcalChart extends ConsumerWidget {
  const KcalChart({required this.dateRange, required this.recipeId, super.key});

  final DateTimeRange dateRange;
  final String? recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kcalChartNotifierProvider(dateRange, recipeId));

    return AsyncChart(
      asyncState: state,
      builder: (data) => BaseChart(
        state: data,
        horizontalInterval: 100,
        horizontalTitleInterval: 500,
      ),
    );
  }
}
