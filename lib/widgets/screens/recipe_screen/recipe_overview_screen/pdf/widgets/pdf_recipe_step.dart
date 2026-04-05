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
  });

  final AppLocalizations localization;

  final int index;
  final RecipeStepData step;
  final Map<String, GroceryData> groceries;
  final NumberFormat doubleNumberFormat;

  static final PdfColor grey400 = PdfColor.fromHex('#BDBDBD');
  static final PdfColor blue700 = PdfColor.fromHex('#1976D2');
  static final PdfColor orange700 = PdfColor.fromHex('#F57C00');
  static final PdfColor white = PdfColor.fromHex('#FFFFFF');

  @override
  Widget build(Context context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: grey400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: blue700,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${localization.step} ${index + 1}',
                  style: TextStyle(
                    color: white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (step.minutes != null) ...[
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: orange700,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${step.minutes} min',
                    style: TextStyle(color: white, fontSize: 12),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          Text(step.description, style: TextStyle(fontSize: 12)),
          if (step.ingredients.isNotEmpty) ...[
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 8),
            PdfIngredientsList(
              localization: localization,
              ingredients: step.ingredients,
              groceries: groceries,
              doubleNumberFormat: doubleNumberFormat,
            ),
          ],
        ],
      ),
    );
  }
}
