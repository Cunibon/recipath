import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/main_screen/local_image.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';

class CompactRecipeItem extends ConsumerWidget {
  const CompactRecipeItem({required this.data, super.key});
  final RecipeData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      for (final ingredient in data.getIngredients()) {
                        ref
                            .read(shoppingNotifierProvider.notifier)
                            .addShoppingItem(
                              ShoppingData(
                                id: randomAlphaNumeric(16),
                                done: false,
                                ingredient: ingredient,
                              ),
                            );
                      }
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  IconButton(
                    onPressed: () => context.go(
                      Uri(
                        path: './${MainRoutes.createRecipe.path}',
                        queryParameters: {idParameter: data.id},
                      ).toString(),
                    ),
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                if (data.imageName != null)
                  LocalImage(fileName: data.imageName!),
                Expanded(
                  child: Column(
                    children: [
                      Text(data.title),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: data
                            .getIngredients()
                            .map(
                              (e) => Text(
                                "● ${e.toReadable(groceryMap[e.groceryId]!)}",
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
