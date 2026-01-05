import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';

class CompactIngredientView extends ConsumerWidget {
  const CompactIngredientView({
    required this.ingredients,
    required this.storageData,
    required this.groceryMap,
    super.key,
  });

  final List<IngredientData> ingredients;

  final Map<String, StorageData> storageData;
  final Map<String, GroceryData> groceryMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitLocalized = localizeUnits(context);
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: ingredients.map((e) {
        final storageItem = storageData[e.groceryId];
        final inStorage = e.amount <= (storageItem?.ingredient.amount ?? 0);

        return HighlightableText(
          "● ${e.toReadable(grocery: groceryMap[e.groceryId]!, unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)}",
          style: inStorage && ref.watch(storageModeProvider)
              ? TextStyle(color: Colors.green[600])
              : null,
        );
      }).toList(),
    );
  }
}
