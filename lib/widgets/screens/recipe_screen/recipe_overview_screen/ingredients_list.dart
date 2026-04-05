import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class IngredientsList extends ConsumerWidget {
  const IngredientsList({required this.ingredients, super.key});

  final List<IngredientData> ingredients;

  static String buildString({
    required AppLocalizations localization,
    required NumberFormat doubleNumberFormat,
    required List<IngredientData> ingredients,
    required Map<String, GroceryData> groceryMap,
  }) {
    final unitLocalized = localizeUnits(localization);
    final ingredientBuffer = StringBuffer();

    ingredientBuffer.writeln("${localization.ingredients}:");

    for (final ingredient in ingredients) {
      ingredientBuffer.writeln(
        "● ${ingredient.toReadable(grocery: groceryMap[ingredient.groceryId]!, unitLocalized: unitLocalized, doubleNumberFormat: doubleNumberFormat)}",
      );
    }

    return ingredientBuffer.toString().trimRight();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);
    final groceryMap = ref.watch(groceryProvider).value!;

    return Text(
      buildString(
        localization: localization,
        doubleNumberFormat: doubleNumberFormat,
        ingredients: ingredients,
        groceryMap: groceryMap,
      ),
    );
  }
}
