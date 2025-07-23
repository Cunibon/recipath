import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipe_list/widgets/recipe_screen/local_image.dart';

class CompactRecipeItem extends ConsumerWidget {
  const CompactRecipeItem({required this.data, super.key});
  final RecipeData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider).value!;

    return GestureDetector(
      onTap: () => context.go('${RootRoutes.mainRoute.path}/recipe/${data.id}'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.imageName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    width: 100,
                    child: LocalImage(fileName: data.imageName!),
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
                            data.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(shoppingModifierNotifierProvider)
                                .addItems(
                                  data.getIngredients(groceryMap),
                                  groceryMap,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Added items to shopping list!"),
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ],
                    ),
                    CompactIngredientView(
                      checkStorage: true,
                      ingredients: data.getIngredients(groceryMap),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
