import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class IngredientItem extends ConsumerStatefulWidget {
  const IngredientItem({
    required this.index,
    required this.data,
    required this.onChanged,
    super.key,
  });

  final int index;
  final IngredientData data;
  final void Function(IngredientData newIngredient) onChanged;

  @override
  ConsumerState<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends ConsumerState<IngredientItem> {
  final amountController = TextEditingController();
  late bool isMisc;

  @override
  void initState() {
    super.initState();
    amountController.text = doubleNumberFormat.format(widget.data.amount);
    isMisc = UnitConversion.unitType(widget.data.unit) == UnitType.misc;
  }

  @override
  Widget build(BuildContext context) {
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
            decoration: InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) =>
                value == null ||
                    value.isEmpty ||
                    doubleNumberFormat.tryParse(value) == 0
                ? "Add amount"
                : null,
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
                    widget.data.unit.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Unit"),
                  value: widget.data.unit,
                  validator: (value) => value == null ? "Add unit" : null,
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
                  onChanged: (value) {
                    if (value != null) {
                      final newAmount = UnitConversion.convert(
                        widget.data.amount,
                        widget.data.unit,
                        value,
                      );
                      amountController.text = doubleNumberFormat.format(
                        newAmount,
                      );
                      widget.onChanged(
                        widget.data.copyWith(unit: value, amount: newAmount),
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
          ),
        ),
      ],
    );
  }
}
