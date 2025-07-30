import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/local_image.dart';
import 'package:recipe_list/widgets/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_overview_screen/ingredients_list.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_overview_screen/nutriments_list.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_overview_screen/recipe_button/track_recipe_button.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_overview_screen/recipe_step.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_routes.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(
      recipeNotifierProvider.select((value) => value.value?[recipeId]),
    );

    if (recipe == null) {
      return Center(child: Text("Something went wrong :("));
    }

    final groceries = ref.watch(groceryNotifierProvider).value!;
    final ingredients = recipe.getIngredients(groceries);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(
              Uri(
                path:
                    '${RootRoutes.recipeRoute.path}/recipeOverview/$recipeId/${MainRoutes.createRecipe.path}',
                queryParameters: {idParameter: recipeId},
              ).toString(),
            ),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButton: TrackRecipeButton(recipeId: recipeId),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.imageName != null) ...[
                LocalImage(fileName: recipe.imageName!),
                Divider(),
              ],
              if (recipe.servings != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Servings: ${recipe.servings}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: double.infinity,
                            child: IngredientsList(ingredients: ingredients),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: double.infinity,
                            child: NutrimentsList(
                              ingredients: ingredients,
                              servings: recipe.servings,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < recipe.steps.length; i++)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RecipeStep(index: i, step: recipe.steps[i]),
                  ),
                ),
              SizedBox(height: 78),
            ],
          ),
        ),
      ),
    );
  }
}
