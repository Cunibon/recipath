import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/grocery_chart/providers/grocery_chart_notifier.dart';

class GroceryChart extends ConsumerWidget {
  const GroceryChart({
    required this.dateRange,
    required this.recipeId,
    super.key,
  });

  final DateTimeRange dateRange;
  final String? recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groceryChartNotifierProvider(dateRange, recipeId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Grocery usage", style: Theme.of(context).textTheme.titleLarge),
        Divider(),
        AsyncChart(
          asyncState: state,
          builder: (data) => BaseChart(
            state: data,
            horizontalInterval: 100,
            horizontalTitleInterval: 500,
          ),
        ),
      ],
    );
  }
}
