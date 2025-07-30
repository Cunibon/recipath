import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class IngredientsList extends ConsumerWidget {
  const IngredientsList({required this.ingredients, super.key});

  final List<IngredientData> ingredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    final ingredientBuffer = StringBuffer();

    ingredientBuffer.writeln("Ingredients:");

    for (final ingredient in ingredients) {
      ingredientBuffer.writeln(
        "● ${ingredient.toReadable(groceryMap[ingredient.groceryId]!)}",
      );
    }

    return Text(ingredientBuffer.toString().trimRight());
  }
}
