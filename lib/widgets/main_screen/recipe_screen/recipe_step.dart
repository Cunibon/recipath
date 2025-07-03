import 'package:flutter/material.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/ingredients_list.dart';

class RecipeStep extends StatelessWidget {
  const RecipeStep({required this.step, super.key});

  final RecipeStepData step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(step.description),
        IngredientsList(ingredients: step.ingredients),
      ],
    );
  }
}
