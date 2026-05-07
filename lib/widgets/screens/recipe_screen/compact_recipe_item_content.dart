import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/background_image.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipath/widgets/tag/tag_list.dart';

class CompactRecipeItemContent extends ConsumerWidget {
  const CompactRecipeItemContent({
    super.key,
    required this.recipeData,
    this.servings,
    required this.groceryMap,
    this.storageData = const {},
    this.tags = const {},
    this.trailingTitle,
    this.onTagTapped,
  });

  final RecipeData recipeData;
  final int? servings;
  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storageData;
  final Set<TagData> tags;

  final Widget? trailingTitle;

  final void Function(TagData)? onTagTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundImage(
      imageName: recipeData.imageName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: .start,
            children: [
              Flexible(
                child: HighlightableText(
                  recipeData.title.trim(),
                  style: TextTheme.of(context).titleMedium,
                ),
              ),
              ?trailingTitle,
            ],
          ),
          Text(
            servings != null
                ? "${AppLocalizations.of(context)!.servings}: $servings"
                : "",
          ),
          CompactIngredientView(
            ingredients: recipeData.getIngredients(groceryMap),
            groceryMap: groceryMap,
            storageData: storageData,
          ),
          if (tags.isNotEmpty) ...[
            Divider(),
            TagList(currentTags: tags, onTagTapped: onTagTapped),
          ],
        ],
      ),
    );
  }
}
