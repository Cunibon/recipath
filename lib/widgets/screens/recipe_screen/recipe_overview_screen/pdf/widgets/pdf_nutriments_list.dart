import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/nutriments_list.dart';

class PdfNutrimentsList extends StatelessWidget {
  PdfNutrimentsList({
    required this.localization,
    required this.ingredients,
    required this.groceries,
    required this.doubleNumberFormat,
    this.servings,
    required this.surfaceContainerColor,
    required this.primaryColor,
  });

  final AppLocalizations localization;
  final IList<IngredientData> ingredients;
  final IMap<String, GroceryData> groceries;
  final NumberFormat doubleNumberFormat;
  final int? servings;
  final PdfColor surfaceContainerColor;
  final PdfColor primaryColor;

  @override
  Widget build(Context context) {
    final aggregatedNutriments = NutrimentsList.aggregateNutriments(
      ingredients,
      groceries,
    );

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: surfaceContainerColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        NutrimentsList.buildString(
          localization: localization,
          doubleNumberFormat: doubleNumberFormat,
          aggregatedNutriments: aggregatedNutriments,
          servings: servings,
        ),
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
