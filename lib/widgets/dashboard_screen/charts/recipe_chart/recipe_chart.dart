import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/providers/recipe_chart_notifier.dart';

class RecipeChart extends ConsumerWidget {
  const RecipeChart({
    required this.dateRange,
    required this.recipeId,
    required this.onTap,
    super.key,
  });

  final DateTimeRange dateRange;
  final String? recipeId;

  final void Function(String? recipeId) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recipeChartNotifierProvider(dateRange, recipeId));

    return AsyncChart(
      asyncState: state,
      horizontalInterval: 1,
      horizontalTitleInterval: 10,
      onTap: (index) =>
          onTap(index != null ? state.value!.entries[index].identifier : null),
    );
  }
}
