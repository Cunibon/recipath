import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

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
    final unitLocalized = localizeUnits(context);

    final groceries = ref.watch(groceryNotifierProvider).value!;

    void switchState() {
      final shoppingNotifier = ref.read(shoppingModifierNotifierProvider);
      final storageNotifier = ref.read(storageModifierNotifierProvider);

      final ingredientRep = IngredientData(
        id: randomAlphaNumeric(16),
        amount: data.count * groceries[data.ingredient.groceryId]!.normalAmount,
        unit: data.ingredient.unit,
        groceryId: data.ingredient.groceryId,
      );

      if (data.done) {
        shoppingNotifier.addItems([data.ingredient], groceries);
        shoppingNotifier.deleteItem(data);
        storageNotifier.subtractItem(ingredientRep);
      } else {
        shoppingNotifier.updateItem(data.copyWith(done: true));
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
                child: HighlightableText(
                  data.toReadable(
                    groceries[data.ingredient.groceryId]!,
                    ingredientData?.amount ?? 0,
                    unitLocalized,
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
                    ref.read(shoppingModifierNotifierProvider).deleteItem(data);
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
