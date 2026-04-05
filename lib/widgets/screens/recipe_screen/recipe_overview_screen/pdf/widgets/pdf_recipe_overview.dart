import 'dart:io';

import 'package:flutter/material.dart' as flutter;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/utils/color_extension.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_header.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_step.dart';

class PdfRecipeOverview extends StatelessWidget {
  PdfRecipeOverview({
    required this.recipe,
    required this.image,
    required this.groceries,
    required this.localization,
    required this.doubleNumberFormat,
    required this.theme,
  });

  final RecipeData recipe;
  final File? image;
  final AppLocalizations localization;
  final Map<String, GroceryData> groceries;
  final NumberFormat doubleNumberFormat;
  final flutter.ThemeData theme;

  List<IngredientData> get _aggregatedIngredients =>
      recipe.getIngredients(groceries);

  PdfColor get _primaryColor => theme.colorScheme.primary.toPdfColor();
  PdfColor get _onPrimaryColor => theme.colorScheme.onPrimary.toPdfColor();
  PdfColor get _surfaceContainerColor =>
      theme.colorScheme.surfaceContainer.toPdfColor();

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PdfRecipeHeader(
          recipe: recipe,
          localization: localization,
          primaryColor: _primaryColor,
          onPrimaryColor: _onPrimaryColor,
        ),
        SizedBox(height: 12),
        PdfRecipeContent(
          image: image,
          localization: localization,
          aggregatedIngredients: _aggregatedIngredients,
          groceries: groceries,
          doubleNumberFormat: doubleNumberFormat,
          servings: recipe.servings,
          surfaceContainerColor: _surfaceContainerColor,
          primaryColor: _primaryColor,
        ),
        for (int i = 0; i < recipe.steps.length; i++) ...[
          SizedBox(height: 8),
          PdfRecipeStep(
            localization: localization,
            index: i,
            step: recipe.steps[i],
            groceries: groceries,
            doubleNumberFormat: doubleNumberFormat,
            surfaceContainerColor: _surfaceContainerColor,
            primaryColor: _primaryColor,
          ),
        ],
      ],
    );
  }
}
