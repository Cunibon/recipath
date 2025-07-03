import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class IngredientItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final grocery = ref.watch(
      groceryNotifierProvider.select((value) => value[data.groceryId]),
    )!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ReorderableDragStartListener(
          index: index,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.drag_handle),
          ),
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            decoration: InputDecoration(labelText: "Amount"),
            initialValue: doubleNumberFormat.format(data.amount),
            validator: (value) =>
                value == null || value.isEmpty ? "Add amount" : null,
            onChanged: (value) {
              final parsed = double.tryParse(value);
              if (parsed != null) {
                onChanged(data.copyWith(amount: parsed));
              }
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Unit"),
            value: data.unit,
            validator: (value) => value == null ? "Add unit" : null,
            items: UnitEnum.values
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onChanged(data.copyWith(unit: value));
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
