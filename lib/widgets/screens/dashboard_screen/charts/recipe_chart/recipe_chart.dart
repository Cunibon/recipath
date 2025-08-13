import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/generic/expandable.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/async_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/base_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/recipe_chart/providers/recipe_chart_notifier.dart';

class RecipeChart extends ConsumerWidget {
  const RecipeChart({
    required this.dateRange,
    required this.selectedRecipes,
    required this.onTap,
    super.key,
  });

  final DateTimeRange dateRange;
  final Set<String> selectedRecipes;

  final void Function(String? recipeId) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      recipeChartNotifierProvider(dateRange, selectedRecipes),
    );

    return Expandable(
      titleBuilder: (expanded) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Recipe usage",
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
                horizontalInterval: 1,
                horizontalTitleInterval: 10,
                onTap: (index) => onTap(
                  index != null ? state.value!.entries[index].identifier : null,
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
