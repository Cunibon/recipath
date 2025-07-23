import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/create_recipe_screen/add_groceries_dialog.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/storage_item.dart';

class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(storageNotifierProvider).value!.values.toList();
    final groceries = ref.watch(groceryNotifierProvider).value!;

    return NavigationDrawerScaffold(
      actions: [
        TextButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => ClearConfirmationDialog(),
            );

            if (result == true) {
              ref.read(storageModifierNotifierProvider).clear();
            }
          },
          child: Text("Clear"),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final storageMap = ref.read(storageNotifierProvider).value!;

          final groceries = (await showDialog<Set<GroceryData>>(
            context: context,
            builder: (context) => AddGroceriesDialog(
              selected: items.map((e) => e.groceryId),
              allowSelectedRemoval: false,
            ),
          ))?.where((e) => !storageMap.containsKey(e.id));

          if (groceries != null) {
            for (final gorcery in groceries) {
              ref
                  .read(storageModifierNotifierProvider)
                  .addItem(
                    IngredientData(
                      id: randomAlphaNumeric(16),
                      amount: gorcery.normalAmount,
                      unit: gorcery.unit,
                      groceryId: gorcery.id,
                    ),
                  );
            }
          }
        },
        child: Icon(Icons.add),
      ),
      body: SearchableList(
        type: "Items",
        items: items,
        toSearchable: (item) => item.toReadable(groceries[item.groceryId]!),
        toWidget: (item) => StorageItem(data: item),
        sort: (a, b) => groceries[a.groceryId]!.name.compareTo(
          groceries[b.groceryId]!.name,
        ),
        bottomPadding: 78,
      ),
    );
  }
}
