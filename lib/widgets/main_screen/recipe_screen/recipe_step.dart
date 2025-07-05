import 'package:flutter/material.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/ingredients_list.dart';

class RecipeStep extends StatelessWidget {
  const RecipeStep({required this.index, required this.step, super.key});

  final int index;
  final RecipeStepData step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Step ${index + 1}:",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Divider(),
        Text(step.description, style: Theme.of(context).textTheme.bodyLarge),
        if (step.ingredients.isNotEmpty) ...[
          Divider(),
          IngredientsList(ingredients: step.ingredients),
        ],
      ],
    );
  }
}
