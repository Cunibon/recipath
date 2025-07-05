import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class CompactIngredientView extends ConsumerWidget {
  const CompactIngredientView({
    required this.ingredients,
    this.checkStorage = false,
    super.key,
  });

  final List<IngredientData> ingredients;
  final bool checkStorage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider);
    final storage = checkStorage
        ? ref.watch(storageNotifierProvider)
        : <String, IngredientData>{};

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: ingredients.map((e) {
        final storageItem = storage[e.groceryId];
        bool inStorage = storageItem != null && e.amount <= storageItem.amount;

        return Text(
          "● ${e.toReadable(groceryMap[e.groceryId]!)}",
          style: inStorage ? TextStyle(color: Colors.green) : null,
        );
      }).toList(),
    );
  }
}
