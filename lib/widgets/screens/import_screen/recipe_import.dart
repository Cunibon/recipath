import 'package:flutter/material.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_state.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';

class RecipeImport extends StatelessWidget {
  const RecipeImport({required this.data, super.key});

  final ImportScreenState data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final recipe in data.originalRecipe)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CompactRecipeItemContent(
                  compactRecipeData: CompactRecipeItemData(
                    recipeData: recipe,
                    averageTime: null,
                    groceryMap: data.originalGrocery,
                    tags: {},
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
