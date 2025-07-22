import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/generic/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class ShoppingItem extends ConsumerWidget {
  const ShoppingItem({
    required this.data,
    required this.ingredientData,
    super.key,
  });

  final ShoppingData data;
  final IngredientData? ingredientData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceryNotifierProvider).value!;

    void switchState() {
      final notifier = ref.read(shoppingNotifierProvider.notifier);
      final storageNotifier = ref.read(storageNotifierProvider.notifier);

      final ingredientRep = IngredientData(
        id: randomAlphaNumeric(16),
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
            children: [
              IconButton(
                onPressed: switchState,
                icon: Icon(
                  data.done ? Icons.check_box : Icons.check_box_outline_blank,
                ),
              ),
              Expanded(
                child: Text(
                  data.toReadable(
                    groceries[data.ingredient.groceryId]!,
                    ingredientData?.amount ?? 0,
                  ),
                  style: (ingredientData?.amount ?? 0) >= data.ingredient.amount
                      ? TextStyle(color: Colors.green)
                      : null,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final result = data.done
                      ? true
                      : await showDialog(
                          context: context,
                          builder: (context) => DeleteConfirmationDialog(),
                        );

                  if (result == true) {
                    ref
                        .read(shoppingNotifierProvider.notifier)
                        .deleteItem(data);
                  }
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
