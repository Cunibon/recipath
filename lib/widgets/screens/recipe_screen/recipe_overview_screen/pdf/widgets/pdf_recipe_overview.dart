import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_nutriments_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_step.dart';

class PdfRecipeOverview extends StatelessWidget {
  PdfRecipeOverview({
    required this.recipe,
    required this.image,
    required this.groceries,
    required this.localization,
    required this.doubleNumberFormat,
  });

  final RecipeData recipe;
  final File? image;
  final AppLocalizations localization;
  final Map<String, GroceryData> groceries;

  final NumberFormat doubleNumberFormat;

  List<IngredientData> get _aggregatedIngredients =>
      recipe.getIngredients(groceries);

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipe.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (recipe.servings != null)
          Text(
            '${localization.servings}: ${recipe.servings}',
            style: TextStyle(fontSize: 14),
          ),
        Divider(height: 32),
        Row(
          crossAxisAlignment: .start,
          children: [
            if (image != null) ...[
              ClipRRect(
                horizontalRadius: 8,
                verticalRadius: 8,
                child: Image(
                  MemoryImage(image!.readAsBytesSync()),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 16),
            ],
            Flexible(
              child: PdfIngredientsList(
                localization: localization,
                ingredients: _aggregatedIngredients,
                groceries: groceries,
                doubleNumberFormat: doubleNumberFormat,
              ),
            ),
            SizedBox(width: 16),
            Flexible(
              child: PdfNutrimentsList(
                localization: localization,
                ingredients: _aggregatedIngredients,
                groceries: groceries,
                doubleNumberFormat: doubleNumberFormat,
                servings: recipe.servings,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 16),
        for (int i = 0; i < recipe.steps.length; i++) ...[
          PdfRecipeStep(
            localization: localization,
            index: i,
            step: recipe.steps[i],
            groceries: groceries,
            doubleNumberFormat: doubleNumberFormat,
          ),
          SizedBox(height: 12),
        ],
      ],
    );
  }
}
