import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/focus_form_field.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class IngredientItem extends ConsumerWidget {
  const IngredientItem({
    required this.data,
    this.style,
    this.onFocusLost,
    this.onChanged,
    super.key,
  });

  final IngredientData data;
  final TextStyle? style;

  final void Function(String value)? onFocusLost;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final grocery = ref.watch(
      groceryProvider.select((value) => value.value![data.groceryId]),
    )!;

    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: FocusFormField(
                initialValue: doubleNumberFormat.format(data.amount),
                decoration: InputDecoration(labelText: localization.amount),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onFocusLost: onFocusLost,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: HighlightableText(
                "${unitLocalized[data.unit]} ${grocery.name}",
                style: style ?? TextTheme.of(context).bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
