import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class ShoppingItem extends ConsumerWidget {
  const ShoppingItem({required this.data, super.key});

  final ShoppingData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceryNotifierProvider);

    void switchState() {
      final notifier = ref.read(shoppingNotifierProvider.notifier);
      final storageNotifier = ref.read(storageNotifierProvider.notifier);

      final ingredientRep = IngredientData(
        amount: data.count * groceries[data.ingredient.groceryId]!.normalAmount,
        unit: data.ingredient.unit,
        groceryId: data.ingredient.groceryId,
      );

      if (data.done) {
        notifier.addItems([data.ingredient], groceries);
        notifier.deleteItem(data);
        storageNotifier.subtractItem(ingredientRep);
      } else {
        notifier.updateItem(data.copyWith(done: true));
        storageNotifier.addItem(ingredientRep);
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
