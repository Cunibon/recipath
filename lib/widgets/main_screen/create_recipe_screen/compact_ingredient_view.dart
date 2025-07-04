import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class CompactIngredientView extends ConsumerWidget {
  const CompactIngredientView({required this.ingredients, super.key});

  final List<IngredientData> ingredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider);

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: ingredients
          .map((e) => Text("● ${e.toReadable(groceryMap[e.groceryId]!)}"))
          .toList(),
    );
  }
}
