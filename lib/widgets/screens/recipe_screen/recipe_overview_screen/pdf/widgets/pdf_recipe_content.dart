import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_nutriments_list.dart';

class PdfRecipeContent extends StatelessWidget {
  PdfRecipeContent({
    required this.image,
    required this.localization,
    required this.aggregatedIngredients,
    required this.groceries,
    required this.doubleNumberFormat,
    required this.servings,
    required this.surfaceContainerColor,
    required this.primaryColor,
  });

  final File? image;
  final AppLocalizations localization;
  final List<IngredientData> aggregatedIngredients;
  final Map<String, GroceryData> groceries;
  final NumberFormat doubleNumberFormat;
  final int? servings;
  final PdfColor surfaceContainerColor;
  final PdfColor primaryColor;

  @override
  Widget build(Context context) {
    if (image != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            child: ClipRRect(
              horizontalRadius: 8,
              verticalRadius: 8,
              child: Image(
                MemoryImage(image!.readAsBytesSync()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Flexible(
            child: PdfIngredientsList(
              localization: localization,
              ingredients: aggregatedIngredients,
              groceries: groceries,
              doubleNumberFormat: doubleNumberFormat,
              surfaceContainerColor: surfaceContainerColor,
              primaryColor: primaryColor,
            ),
          ),
          SizedBox(width: 12),
          Flexible(
            child: PdfNutrimentsList(
              localization: localization,
              ingredients: aggregatedIngredients,
              groceries: groceries,
              doubleNumberFormat: doubleNumberFormat,
              servings: servings,
              surfaceContainerColor: surfaceContainerColor,
              primaryColor: primaryColor,
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: PdfIngredientsList(
            localization: localization,
            ingredients: aggregatedIngredients,
            groceries: groceries,
            doubleNumberFormat: doubleNumberFormat,
            surfaceContainerColor: surfaceContainerColor,
            primaryColor: primaryColor,
          ),
        ),
        SizedBox(width: 12),
        Flexible(
          child: PdfNutrimentsList(
            localization: localization,
            ingredients: aggregatedIngredients,
            groceries: groceries,
            doubleNumberFormat: doubleNumberFormat,
            servings: servings,
            surfaceContainerColor: surfaceContainerColor,
            primaryColor: primaryColor,
          ),
        ),
      ],
    );
  }
}
