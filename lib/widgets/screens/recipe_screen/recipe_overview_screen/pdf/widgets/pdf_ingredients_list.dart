import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';

class PdfIngredientsList extends StatelessWidget {
  PdfIngredientsList({
    required this.localization,
    required this.ingredients,
    required this.groceries,
    required this.doubleNumberFormat,
    required this.surfaceContainerColor,
    required this.primaryColor,
  });

  final AppLocalizations localization;
  final List<IngredientData> ingredients;
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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        IngredientsList.buildString(
          localization: localization,
          doubleNumberFormat: doubleNumberFormat,
          ingredients: ingredients,
          groceryMap: groceries,
        ),
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
