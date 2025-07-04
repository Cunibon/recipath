import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/shopping_item.dart';

class ShoppingScreen extends ConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(shoppingNotifierProvider).values.toList();
    final groceries = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      actions: [
        TextButton(
          onPressed: ref.read(shoppingNotifierProvider.notifier).clear,
          child: Text("Clear"),
        ),
      ],
      body: SearchableList(
        type: "Items",
        items: items,
        toSearchable: (item) =>
            item.toReadable(groceries[item.ingredient.groceryId]!),
        toWidget: (item) => ShoppingItem(data: item),
        sort: (a, b) {
          if (a.done == b.done) {
            return groceries[a.ingredient.groceryId]!.name.compareTo(
              groceries[b.ingredient.groceryId]!.name,
            );
          } else {
            return a.done ? 1 : -1;
          }
        },
      ),
    );
  }
}
