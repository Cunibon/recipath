import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/generic/expandable.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/grocery_chart/providers/grocery_chart_notifier.dart';

class GroceryChart extends ConsumerWidget {
  const GroceryChart({
    required this.dateRange,
    required this.selectedRecipes,
    super.key,
  });

  final DateTimeRange dateRange;
  final Set<String> selectedRecipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      groceryChartNotifierProvider(dateRange, selectedRecipes),
    );

    return Expandable(
      titleBuilder: (expanded) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Grocery usage",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Icon(
                expanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
              ),
            ],
          ),
          Divider(),
        ],
      ),
      contentBuilder: (expanded) => expanded
          ? AsyncChart(
              asyncState: state,
              builder: (data) => BaseChart(
                state: data,
                horizontalInterval: 100,
                horizontalTitleInterval: 500,
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
