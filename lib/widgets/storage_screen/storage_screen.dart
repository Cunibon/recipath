import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/create_recipe_screen/add_groceries_dialog.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/storage_item.dart';

class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(storageNotifierProvider);
    final asyncGroceries = ref.watch(groceryNotifierProvider);

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
              selected: asyncItems.value!.values.toList().map(
                (e) => e.groceryId,
              ),
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
      body: NotifierFutureBuilder(
        futures: [asyncItems, asyncGroceries],
        childBuilder: () => SearchableList(
          type: "Items",
          items: asyncItems.value!.values.toList(),
          toSearchable: (item) =>
              item.toReadable(asyncGroceries.value![item.groceryId]!),
          toWidget: (item) => StorageItem(data: item),
          sort: (a, b) => asyncGroceries.value![a.groceryId]!.name.compareTo(
            asyncGroceries.value![b.groceryId]!.name,
          ),
          bottomPadding: 78,
        ),
      ),
    );
  }
}
