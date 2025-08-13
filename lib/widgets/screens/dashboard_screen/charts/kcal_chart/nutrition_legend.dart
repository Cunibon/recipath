import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/chart_entry.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/kcal_chart/providers/nutrient_color_notifier.dart';

class NutritionLegend extends ConsumerWidget {
  const NutritionLegend({required this.data, super.key});

  final ChartState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutrimentsMap = ref.watch(nutrimentColorNotifierProvider);
    final nutrimentEntries = nutrimentsMap.entries.toList();

    final Map<String, double> nutrimentSum = {};

    for (final chartEntry in data.entries) {
      final barRods = chartEntry.groupData.barRods;
      for (int i = 0; i < barRods.length; i++) {
        final barRod = barRods[i];
        final nutrimentKey = nutrimentEntries[i].key;

        final currentValue = nutrimentSum.putIfAbsent(nutrimentKey, () => 0);

        nutrimentSum[nutrimentKey] = currentValue + barRod.toY;
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        for (final entry in nutrimentEntries) ...[
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: entry.value,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 5),
                  Text(entry.key),
                ],
              ),
              Text(
                "Sum: ${doubleNumberFormat.format(nutrimentSum[entry.key] ?? 0)}",
              ),
            ],
          ),
        ],
      ],
    );
  }
}
