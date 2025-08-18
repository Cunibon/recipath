import 'package:flutter/material.dart';
import 'package:recipe_list/l10n/app_localizations.dart';

enum Nutriments {
  kcal(Colors.purple),
  fat(Colors.orange),
  carbs(Colors.brown),
  protein(Colors.grey),
  fiber(Colors.green);

  const Nutriments(this.color);

  final Color color;
}

Map<Nutriments, String> localizeNutriments(BuildContext context) {
  final localization = AppLocalizations.of(context)!;

  return {
    Nutriments.kcal: localization.kcal,
    Nutriments.fat: localization.fat,
    Nutriments.carbs: localization.carbs,
    Nutriments.protein: localization.protein,
    Nutriments.fiber: localization.fiber,
  };
}
