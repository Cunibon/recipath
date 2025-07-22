import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/generic/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/add_shopping_dialog.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/shopping_item.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class ShoppingScreen extends ConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(shoppingNotifierProvider).value!.values.toList();
    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    final storage = ref.watch(storageNotifierProvider).value!;

    return NavigationDrawerScaffold(
      actions: [
        TextButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => ClearConfirmationDialog(),
            );

            if (result == true) {
              ref.read(shoppingNotifierProvider.notifier).clear();
            }
          },
          child: Text("Clear"),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<IngredientData>(
            context: context,
            builder: (context) => AddShoppingDialog(),
          );

          if (result != null) {
            ref.read(shoppingNotifierProvider.notifier).addItems([
              result,
            ], groceryMap);
          }
        },
        child: Icon(Icons.add),
      ),
      body: SearchableList(
        type: "Items",
        items: items,
        toSearchable: (item) => item.toReadable(
          groceryMap[item.ingredient.groceryId]!,
          storage[item.ingredient.groceryId]?.amount ?? 0,
        ),
        toWidget: (item) => ShoppingItem(
          data: item,
          ingredientData: storage[item.ingredient.groceryId],
        ),
        sort: (a, b) {
          if (a.done == b.done) {
            return groceryMap[a.ingredient.groceryId]!.name.compareTo(
              groceryMap[b.ingredient.groceryId]!.name,
            );
          } else {
            return a.done ? 1 : -1;
          }
        },
        bottomPadding: 78,
      ),
    );
  }
}
