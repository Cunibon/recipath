import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';

class GroceryImportItem extends ConsumerWidget {
  const GroceryImportItem({
    required this.original,
    required this.current,
    required this.onTap,
    required this.clear,
    super.key,
  });

  final GroceryData original;
  final GroceryData current;

  final void Function() onTap;
  final void Function() clear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final unitLocalized = localizeUnits(context);

    final colorSchema = ColorScheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(original.name, style: TextTheme.of(context).titleMedium),
                Text(
                  "${doubleNumberFormat.format(original.normalAmount)}${unitLocalized[original.unit]}",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                color: original == current
                    ? colorSchema.primaryContainer
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              current.name,
                              style: TextTheme.of(context).titleMedium
                                  ?.copyWith(
                                    color: colorSchema.onPrimaryContainer,
                                  ),
                            ),
                            Text(
                              "${doubleNumberFormat.format(current.normalAmount)}${unitLocalized[current.unit]}",
                            ),
                          ],
                        ),
                      ),
                      if (original != current)
                        GestureDetector(onTap: clear, child: Icon(Icons.clear)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
