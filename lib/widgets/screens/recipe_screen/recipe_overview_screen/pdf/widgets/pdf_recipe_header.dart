import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';

class PdfRecipeHeader extends StatelessWidget {
  PdfRecipeHeader({
    required this.recipe,
    required this.localization,
    required this.primaryColor,
    required this.onPrimaryColor,
  });

  final RecipeData recipe;
  final AppLocalizations localization;
  final PdfColor primaryColor;
  final PdfColor onPrimaryColor;

  @override
  Widget build(Context context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: onPrimaryColor,
            ),
          ),
          if (recipe.servings != null) ...[
            SizedBox(height: 4),
            Text(
              '${localization.servings}: ${recipe.servings}',
              style: TextStyle(fontSize: 11, color: onPrimaryColor),
            ),
          ],
        ],
      ),
    );
  }
}
