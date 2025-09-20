import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class StorageItem extends ConsumerWidget {
  const StorageItem({required this.data, super.key});

  final StorageData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final grocery = ref.watch(
      groceryProvider.select(
        (value) => value.value![data.ingredient.groceryId],
      ),
    )!;

    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: TextFormField(
                key: Key(data.ingredient.groceryId),
                initialValue: doubleNumberFormat.format(data.ingredient.amount),
                decoration: InputDecoration(labelText: localization.amount),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onEditingComplete: () {
                  if (data.ingredient.amount == 0) {
                    ref
                        .read(storageModifierProvider)
                        .deleteItem(
                          data.copyWith(
                            ingredient: data.ingredient.copyWith(
                              amount: data.ingredient.amount,
                            ),
                          ),
                        );
                  }
                },
                onChanged: (value) {
                  final parsed = doubleNumberFormat.tryParse(value);
                  if (parsed != null) {
                    ref
                        .read(storageModifierProvider)
                        .updateItem(
                          data.copyWith(
                            ingredient: data.ingredient.copyWith(
                              amount: parsed.toDouble(),
                            ),
                          ),
                        );
                  }
                },
              ),
            ),
            Expanded(
              child: HighlightableText(
                "${unitLocalized[data.ingredient.unit]} ${grocery.name}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
