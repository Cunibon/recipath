import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/chart_entry.dart';
import 'package:recipath/widgets/screens/dashboard_screen/charts/kcal_chart/providers/nutriment_enum.dart';

class NutritionLegend extends ConsumerWidget {
  const NutritionLegend({required this.data, super.key});

  final ChartState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutrimentEntries = Nutriments.values;
    final localized = localizeNutriments(context);

    final Map<String, double> nutrimentSum = {};

    for (final chartEntry in data.entries) {
      final barRods = chartEntry.groupData.barRods;
      for (int i = 0; i < barRods.length; i++) {
        final barRod = barRods[i];
        final nutrimentKey = nutrimentEntries[i].name;

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
                      color: entry.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 5),
                  Text(localized[entry]!),
                ],
              ),
              Text(
                "Sum: ${doubleNumberFormat.format(nutrimentSum[entry.name] ?? 0)}",
              ),
            ],
          ),
        ],
      ],
    );
  }
}
