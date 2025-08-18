import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class NutrimentsList extends ConsumerWidget {
  const NutrimentsList({required this.ingredients, this.servings, super.key});

  final List<IngredientData> ingredients;
  final int? servings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    final Map<String, double> aggregatedNutriments = {};

    for (final ingredient in ingredients) {
      final grocery = groceryMap[ingredient.groceryId]!;

      final gramValue = grocery.convertToGram(
        ingredient.amount,
        ingredient.unit,
      );

      final additiveValue = gramValue / 100;

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

    nutrimentBuffer.writeln("${localization.nutriments}:");

    for (final entry in aggregatedNutriments.entries) {
      nutrimentBuffer.writeln(
        "● ${entry.key}: ${doubleNumberFormat.format(entry.value)}",
      );
    }

    if (servings != null) {
      nutrimentBuffer.writeln("\n${localization.perServing}:");

      for (final entry in aggregatedNutriments.entries) {
        nutrimentBuffer.writeln(
          "● ${entry.key}: ${doubleNumberFormat.format(entry.value / servings!)}",
        );
      }
    }

    return Text(nutrimentBuffer.toString().trimRight());
  }
}
