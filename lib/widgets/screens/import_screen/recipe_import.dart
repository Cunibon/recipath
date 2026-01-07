import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_screen_state.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';

class RecipeImport extends ConsumerWidget {
  const RecipeImport({required this.data, super.key});

  final ImportScreenState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 78),
      child: Column(
        children: [
          for (final recipe in data.originalRecipe)
            GestureDetector(
              onTap: () {
                ref
                    .read(recipeImportScreenProvider(data.path).notifier)
                    .toggleRecipe(recipe);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CompactRecipeItemContent(
                    compactRecipeData: CompactRecipeItemData(
                      recipeData: recipe,
                      averageTime: null,
                      groceryMap: data.originalGrocery,
                      tags: {},
                    ),
                    trailingTitle: Icon(
                      data.importRecipe.contains(recipe)
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
