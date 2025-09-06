import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class IngredientItem extends ConsumerStatefulWidget {
  const IngredientItem({
    required this.index,
    required this.data,
    required this.localizedUnits,
    required this.onChanged,
    required this.remove,
    super.key,
  });

  final int index;
  final IngredientData data;
  final Map<UnitEnum, String> localizedUnits;
  final void Function(IngredientData newIngredient) onChanged;
  final void Function() remove;

  @override
  ConsumerState<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends ConsumerState<IngredientItem> {
  final amountController = TextEditingController();
  late bool isMisc;

  @override
  void initState() {
    super.initState();
    final doubleNumberFormat = ref.read(doubleNumberFormatNotifierProvider);

    amountController.text = doubleNumberFormat.format(widget.data.amount);
    isMisc = UnitConversion.unitType(widget.data.unit) == UnitType.misc;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

    final grocery = ref.watch(
      groceryNotifierProvider.select(
        (value) => value.value![widget.data.groceryId],
      ),
    )!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ReorderableDragStartListener(
          index: widget.index,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.drag_handle),
          ),
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            controller: amountController,
            decoration: InputDecoration(labelText: localization.amount),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) =>
                value == null ||
                    value.isEmpty ||
                    doubleNumberFormat.tryParse(value) == 0
                ? localization.addAmount
                : null,
            onEditingComplete: () {
              final parsed = doubleNumberFormat.parse(amountController.text);

              if (parsed == 0) {
                widget.remove();
              }
            },
            onChanged: (value) {
              final parsed = doubleNumberFormat.tryParse(value);
              if (parsed != null) {
                widget.onChanged(
                  widget.data.copyWith(amount: parsed.toDouble()),
                );
              }
            },
          ),
        ),
        SizedBox(
          width: 57,
          child: isMisc
              ? SizedBox(
                  width: double.infinity,
                  child: Text(
                    unitLocalized[widget.data.unit]!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(labelText: localization.unit),
                  initialValue: widget.data.unit,
                  validator: (value) =>
                      value == null ? localization.addUnit : null,
                  items:
                      [
                            ...UnitConversion.volumeToMl.keys,
                            ...UnitConversion.weightToGram.keys,
                          ]
                          .map(
                            (e) =>
                                DropdownMenuItem(value: e, child: Text(e.name)),
                          )
                          .toList(),
                  onChanged: (newUnit) {
                    if (newUnit != null) {
                      final newAmount = grocery.convertFromTo(
                        widget.data.amount,
                        widget.data.unit,
                        newUnit,
                      );
                      amountController.text = doubleNumberFormat.format(
                        newAmount,
                      );
                      widget.onChanged(
                        widget.data.copyWith(unit: newUnit, amount: newAmount),
                      );
                    }
                  },
                ),
        ),
        Flexible(
          flex: 5,
          child: Text(
            grocery.name,
            style: Theme.of(context).textTheme.bodyLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
