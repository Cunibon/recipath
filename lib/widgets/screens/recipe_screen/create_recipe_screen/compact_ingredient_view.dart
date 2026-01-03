import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/providers/grocey_storage_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';

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
    final screenState = ref.watch(groceryStorageProvider);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return CachedAsyncValueWrapper(
      asyncState: screenState,
      builder: (data) => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: ingredients.map((e) {
          final storageItem = ref.watch(storageModeProvider)
              ? data.storage[e.groceryId]
              : null;
          final inStorage =
              storageItem != null && e.amount <= storageItem.ingredient.amount;

          return HighlightableText(
            "● ${e.toReadable(grocery: data.groceryMap[e.groceryId]!, unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)}",
            style: inStorage && checkStorage
                ? TextStyle(color: Colors.green[600])
                : null,
          );
        }).toList(),
      ),
    );
  }
}
