import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/local_image.dart';

class HistoryRecipeItem extends ConsumerWidget {
  const HistoryRecipeItem({required this.data, super.key});
  final ({RecipeStatisticData statistics, RecipeData recipe}) data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.recipe.imageName != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SizedBox(
                  width: 100,
                  child: LocalImage(fileName: data.recipe.imageName!),
                ),
              ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          data.recipe.title.trim(),
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ),
                      Text(dateTimeFormat.format(data.statistics.startDate)),
                    ],
                  ),
                  CompactIngredientView(
                    ingredients: data.recipe.getIngredients(groceryMap),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
