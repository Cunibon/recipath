import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/focus_form_field.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';

class ShoppingItem extends ConsumerWidget {
  const ShoppingItem({
    required this.data,
    required this.storageData,
    super.key,
  });

  final ShoppingData data;
  final IngredientData? storageData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final groceries = ref.watch(groceryProvider).value!;
    final grocery = groceries[data.ingredient.groceryId]!;

    void switchState() {
      final shoppingNotifier = ref.read(shoppingModifierProvider);
      final storageNotifier = ref.read(storageModifierProvider);

      final ingredientRep = IngredientData(
        id: randomAlphaNumeric(16),
        amount: data.count * grocery.normalAmount,
        unit: data.ingredient.unit,
        groceryId: data.ingredient.groceryId,
      );

      if (data.done) {
        shoppingNotifier.addItems([data.ingredient], groceries);
        shoppingNotifier.deleteItem(data);
        storageNotifier.subtractItem(ingredientRep);
      } else {
        shoppingNotifier.updateItem(data.copyWith(done: true));
        storageNotifier.addItem(ingredientRep);
      }
    }

    return GestureDetector(
      onTap: switchState,
      child: Card(
        color: data.done
            ? Theme.of(context).colorScheme.surfaceContainerLowest
            : null,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Row(
            children: [
              IconButton(
                onPressed: switchState,
                icon: Icon(
                  data.done ? Icons.check_box : Icons.check_box_outline_blank,
                ),
              ),
              SizedBox(
                width: 50,
                child: FocusFormField(
                  key: Key(data.id),
                  initialValue: data.count.toString(),
                  decoration: InputDecoration(labelText: localization.amount),
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  onFocusLost: (value) {
                    final parsed = int.tryParse(value);
                    if (parsed != null) {
                      if (parsed == 0) {
                        ref.read(shoppingModifierProvider).deleteItem(data);
                      } else if (parsed != data.count) {
                        ref
                            .read(shoppingModifierProvider)
                            .updateItem(
                              data.copyWith(
                                count: parsed,
                                ingredient: data.ingredient.copyWith(
                                  amount: parsed * grocery.normalAmount,
                                ),
                              ),
                            );
                      }
                    }
                  },
                ),
              ),
              Expanded(
                child: HighlightableText(
                  "${grocery.toReadable(unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)} (${doubleNumberFormat.format(data.ingredient.amount)}${unitLocalized[grocery.unit]})",
                  style:
                      ref.watch(storageModeProvider) &&
                          (storageData?.amount ?? 0) >= data.ingredient.amount
                      ? Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.green)
                      : Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final result = data.done
                      ? true
                      : await showDialog(
                          context: context,
                          builder: (context) => DeleteConfirmationDialog(),
                        );

                  if (result == true) {
                    ref.read(shoppingModifierProvider).deleteItem(data);
                  }
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
