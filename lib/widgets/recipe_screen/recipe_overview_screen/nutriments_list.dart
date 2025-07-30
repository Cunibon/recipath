import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class NutrimentsList extends ConsumerWidget {
  const NutrimentsList({required this.ingredients, super.key});

  final List<IngredientData> ingredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    final Map<String, double> aggregatedNutriments = {};

    for (final ingredient in ingredients) {
      final grocery = groceryMap[ingredient.groceryId]!;

      final unitType = UnitConversion.unitType(grocery.unit);

      final gramValue = grocery.convertToGram(
        ingredient.amount,
        ingredient.unit,
      );

      final additiveValue = unitType == UnitType.misc
          ? gramValue
          : gramValue / 100;

      final nutrients = grocery.getNutrients();

      for (final entry in nutrients.entries) {
        if (entry.value == null) continue;

        final currentValue = aggregatedNutriments.putIfAbsent(
          entry.key,
          () => 0,
        );

        aggregatedNutriments[entry.key] =
            currentValue + additiveValue * entry.value!;
      }
    }

    final nutrimentBuffer = StringBuffer();

    nutrimentBuffer.writeln("Nutriments:\n");

    for (final entry in aggregatedNutriments.entries) {
      nutrimentBuffer.writeln(
        "● ${entry.key}: ${doubleNumberFormat.format(entry.value)}",
      );
    }

    return Text(nutrimentBuffer.toString().trimRight());
  }
}
