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

    void switchState() {
      final notifier = ref.read(shoppingNotifierProvider.notifier);
      if (data.done) {
        notifier.addItems([data.ingredient], groceries);
        notifier.deleteItem(data);
      } else {
        notifier.updateItem(data.copyWith(done: true));
      }
    }

    return GestureDetector(
      onTap: switchState,
      child: Card(
        color: data.done
            ? Theme.of(context).colorScheme.surfaceContainerLowest
            : null,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: switchState,
                    icon: Icon(
                      data.done
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ),
                  Text(data.toReadable(groceries[data.ingredient.groceryId]!)),
                ],
              ),
              if (data.done)
                IconButton(
                  onPressed: () => ref
                      .read(shoppingNotifierProvider.notifier)
                      .deleteItem(data),
                  icon: Icon(Icons.delete),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
