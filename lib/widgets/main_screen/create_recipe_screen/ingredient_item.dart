import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
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
      children: [
        ReorderableDragStartListener(
          index: index,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.drag_handle),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Description"),
          initialValue: data.amount.toString(),
          onChanged: (value) {
            final parsed = double.tryParse(value);
            if (parsed != null) {
              onChanged(data.copyWith(amount: parsed));
            }
          },
        ),
        Text("${grocery.unit} ${grocery.name}"),
      ],
    );
  }
}
