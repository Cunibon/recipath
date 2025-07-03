import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/main_screen/local_image.dart';
import 'package:recipe_list/widgets/main_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/ingredients_list.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/recipe_step.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(
      recipeNotifierProvider.select((value) => value[recipeId]),
    )!;
    final groceries = ref.watch(groceryNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.imageName != null) ...[
                LocalImage(fileName: recipe.imageName!),
                Divider(),
              ],
              Text(recipe.title, style: Theme.of(context).textTheme.titleLarge),
              IngredientsList(ingredients: recipe.getIngredients(groceries)),
              for (final step in recipe.steps) ...[
                Divider(),
                RecipeStep(step: step),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
