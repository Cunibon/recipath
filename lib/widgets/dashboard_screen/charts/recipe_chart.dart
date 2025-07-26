import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/providers/recipe_chart_notifier.dart';

class RecipeChart extends ConsumerWidget {
  const RecipeChart({required this.dateRange, super.key});

  final DateTimeRange dateRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeChartNotifierProvider(dateRange));

    return switch (state) {
      AsyncData(:final value) => BaseChart(
        state: value,
        horizontalInterval: 1,
        horizontalTitleInterval: 10,
      ),
      AsyncError() => Center(
        child: const Text('Oops, something unexpected happened'),
      ),
      _ => Center(child: const CircularProgressIndicator()),
    };
  }
}
