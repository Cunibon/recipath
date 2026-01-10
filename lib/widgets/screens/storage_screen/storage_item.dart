import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/generic/ingredient_item.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';

class StorageItem extends ConsumerWidget {
  const StorageItem({required this.data, super.key});

  final StorageData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return IngredientItem(
      data: data.ingredient,
      onFocusLost: (value) {
        final parsed = doubleNumberFormat.tryParse(value)?.toDouble();
        if (parsed != null) {
          if (parsed == 0) {
            ref.read(storageModifierProvider).deleteItem(data);
          } else if (parsed != data.ingredient.amount) {
            ref
                .read(storageModifierProvider)
                .updateItem(
                  data.copyWith(
                    ingredient: data.ingredient.copyWith(amount: parsed),
                  ),
                );
          }
        }
      },
    );
  }
}
