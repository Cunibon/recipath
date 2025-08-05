import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class StorageItem extends ConsumerWidget {
  const StorageItem({required this.data, super.key});

  final StorageData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grocery = ref.watch(
      groceryNotifierProvider.select(
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
                    ref
                        .read(storageModifierNotifierProvider)
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
              child: Text(
                "${data.ingredient.unit.name} ${grocery.name}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            IconButton(
              onPressed: () =>
                  ref.read(storageModifierNotifierProvider).deleteItem(data),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
