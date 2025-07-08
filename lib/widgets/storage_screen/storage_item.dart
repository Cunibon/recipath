import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class StorageItem extends ConsumerWidget {
  const StorageItem({required this.data, super.key});

  final IngredientData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grocery = ref.watch(
      groceryNotifierProvider.select((value) => value[data.groceryId]),
    )!;

    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    initialValue: doubleNumberFormat.format(data.amount),
                    decoration: InputDecoration(labelText: "Amount"),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) =>
                        value == null ||
                            value.isEmpty ||
                            doubleNumberFormat.tryParse(value) == 0
                        ? "Add amount"
                        : null,
                    onChanged: (value) {
                      final parsed = doubleNumberFormat.tryParse(value);
                      if (parsed != null) {
                        ref
                            .read(storageNotifierProvider.notifier)
                            .updateItem(
                              data.copyWith(amount: parsed.toDouble()),
                            );
                      }
                    },
                  ),
                ),
                Text(
                  "${data.unit.name} ${grocery.name}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () =>
                  ref.read(storageNotifierProvider.notifier).deleteItem(data),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
