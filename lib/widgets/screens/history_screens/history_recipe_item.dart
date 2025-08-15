import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/history_screens/data/history_data.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/local_image.dart';

class HistoryRecipeItem extends ConsumerWidget {
  const HistoryRecipeItem({required this.data, super.key});
  final HistoryData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.recipeData.imageName != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SizedBox(
                  width: 100,
                  child: LocalImage(fileName: data.recipeData.imageName!),
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
                          data.recipeData.title.trim(),
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ),
                      Text(timeFormat.format(data.date)),
                    ],
                  ),
                  CachedAsyncValueWrapper(
                    asyncState: ref.watch(groceryNotifierProvider),
                    builder: (groceryData) => CompactIngredientView(
                      ingredients: data.recipeData.getIngredients(groceryData),
                    ),
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
