import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class IngredientsList extends ConsumerWidget {
  const IngredientsList({required this.ingredients, super.key});

  final List<IngredientData> ingredients;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    final ingredientBuffer = StringBuffer();

    ingredientBuffer.writeln("${localization.ingredients}:");

    for (final ingredient in ingredients) {
      ingredientBuffer.writeln(
        "● ${ingredient.toReadable(groceryMap[ingredient.groceryId]!, unitLocalized)}",
      );
    }

    return Text(ingredientBuffer.toString().trimRight());
  }
}
