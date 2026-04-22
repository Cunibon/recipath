import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_ingredients_list.dart';

class PdfRecipeStep extends StatelessWidget {
  PdfRecipeStep({
    required this.localization,
    required this.index,
    required this.step,
    required this.groceries,
    required this.doubleNumberFormat,
    required this.surfaceContainerColor,
    required this.primaryColor,
  });

  final AppLocalizations localization;
  final int index;
  final RecipeStepData step;
  final Map<String, GroceryData> groceries;
  final NumberFormat doubleNumberFormat;
  final PdfColor surfaceContainerColor;
  final PdfColor primaryColor;

  @override
  Widget build(Context context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: surfaceContainerColor,
        border: Border(left: BorderSide(color: primaryColor, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: PdfColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (step.minutes != null) ...[
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${step.minutes} min',
                    style: TextStyle(fontSize: 9),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 6),
          Text(step.description, style: TextStyle(fontSize: 11)),
          if (step.ingredients.isNotEmpty) ...[
            SizedBox(height: 8),
            PdfIngredientsList(
              localization: localization,
              ingredients: step.ingredients,
              groceries: groceries,
              doubleNumberFormat: doubleNumberFormat,
              surfaceContainerColor: surfaceContainerColor,
              primaryColor: primaryColor,
            ),
          ],
        ],
      ),
    );
  }
}
