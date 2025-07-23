import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
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
    final storage = ref.watch(storageNotifierProvider);

    return NotifierFutureBuilder(
      futures: [groceryMap, storage],
      childBuilder: () => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: ingredients.map((e) {
          final storageItem = storage.value![e.groceryId];
          bool inStorage =
              storageItem != null && e.amount <= storageItem.amount;

          return Text(
            "● ${e.toReadable(groceryMap.value![e.groceryId]!)}",
            style: inStorage ? TextStyle(color: Colors.green) : null,
          );
        }).toList(),
      ),
    );
  }
}
