import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/root_routes/root_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/main_screen/local_image.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/main_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/ingredients_list.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/recipe_step.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(
      recipeNotifierProvider.select((value) => value[recipeId]),
    )!;
    final groceries = ref.watch(groceryNotifierProvider);

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
                    '${RootRoutes.mainRoute.path}/recipe/$recipeId/${MainRoutes.createRecipe.path}',
                queryParameters: {idParameter: recipeId},
              ).toString(),
            ),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (final ingredient in ingredients) {
            ref.read(storageNotifierProvider.notifier).subtractItem(ingredient);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 5),
              content: Row(
                children: [
                  Expanded(child: Text("Removed ingredients from storage!")),
                  TextButton(
                    onPressed: () {
                      for (final ingredient in ingredients) {
                        ref
                            .read(storageNotifierProvider.notifier)
                            .addItem(ingredient);
                      }
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Undid removal!")));
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    child: Text(
                      "Undo",
                      style: TextStyle(color: Colors.purple[900]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
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
              IngredientsList(ingredients: ingredients),
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
