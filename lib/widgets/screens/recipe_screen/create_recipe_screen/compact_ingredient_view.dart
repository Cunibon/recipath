import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/generic/notifier_future_builder.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';

class CompactIngredientView extends ConsumerWidget {
  const CompactIngredientView({
    required this.ingredients,
    this.checkStorage = false,
    super.key,
  });

  final List<IngredientData> ingredients;
  final bool checkStorage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitLocalized = localizeUnits(context);
    final groceryMap = ref.watch(groceryNotifierProvider);
    final storage = ref.watch(storageNotifierProvider);

    final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

    return NotifierFutureBuilder(
      futures: [groceryMap, storage],
      childBuilder: () => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: ingredients.map((e) {
          final storageItem = storage.value![e.groceryId];
          bool inStorage =
              storageItem != null && e.amount <= storageItem.ingredient.amount;

          return HighlightableText(
            "● ${e.toReadable(grocery: groceryMap.value![e.groceryId]!, unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)}",
            style: inStorage && checkStorage
                ? TextStyle(color: Colors.green[600])
                : null,
          );
        }).toList(),
      ),
    );
  }
}
