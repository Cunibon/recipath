import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/import_screen/data/recipe_import_screen_state.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';

class RecipeImport extends ConsumerWidget {
  const RecipeImport({required this.data, super.key});

  final RecipeImportScreenState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importData = ref.watch(importDataProvider(data.path)).value!;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 78),
      child: Column(
        children: [
          for (final recipe in importData.recipes)
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
                      groceryMap: importData.groceries,
                      tags: importData.tagsPerRecipe[recipe.id] ?? {},
                    ),
                    trailingTitle: Icon(
                      data.selectedRecipes.contains(recipe)
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
