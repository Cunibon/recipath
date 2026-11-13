import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/generic/normed_dotted_border.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:smart_input_fields/smart_input_fields.dart';

class SuggestionItem extends ConsumerWidget {
  const SuggestionItem({required this.ingredient, super.key});

  final IngredientData ingredient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(localization);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final groceries = ref.watch(groceryProvider).value!;
    final grocery = groceries[ingredient.groceryId]!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NormedDottedBorder(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: FocusInputField(
                  key: Key(ingredient.id),
                  decoration: InputDecoration(labelText: localization.amount),
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  selectOnEnter: true,
                  onFocusLost: (value) {
                    final parsed = int.tryParse(value);
                    if (parsed != null) {
                      if (parsed > 0) {
                        ref.read(shoppingModifierProvider).addItems([
                          ingredient.copyWith(
                            amount: ingredient.amount * parsed,
                          ),
                        ], groceries);
                      }
                    }
                  },
                ),
              ),
              Expanded(
                child: HighlightableText(
                  grocery.toReadable(
                    unitLocalized: unitLocalized,
                    doubleNumberFormat: doubleNumberFormat,
                  ),
                  style: TextTheme.of(context).bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
