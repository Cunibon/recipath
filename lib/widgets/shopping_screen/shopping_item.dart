import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';

class ShoppingItem extends ConsumerWidget {
  const ShoppingItem({required this.data, super.key});

  final ShoppingData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceryNotifierProvider);

    return Card(
      color: data.done ? CardTheme.of(context).color!.withAlpha(128) : null,
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => ref
                      .read(shoppingNotifierProvider.notifier)
                      .addShoppingItem(data.copyWith(done: !data.done)),
                  icon: Icon(
                    data.done ? Icons.check_box : Icons.check_box_outline_blank,
                  ),
                ),
                Text(data.toReadable(groceries[data.ingredient.groceryId]!)),
              ],
            ),
            if (data.done)
              IconButton(
                onPressed: () => ref
                    .read(shoppingNotifierProvider.notifier)
                    .deleteShoppingItem(data),
                icon: Icon(Icons.delete),
              ),
          ],
        ),
      ),
    );
  }
}
