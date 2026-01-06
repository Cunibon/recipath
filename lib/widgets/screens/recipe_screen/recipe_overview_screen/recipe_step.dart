import 'package:flutter/material.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_step_tag.dart';

class RecipeStep extends StatelessWidget {
  const RecipeStep({required this.index, required this.recipeData, super.key});

  final int index;
  final RecipeData recipeData;

  @override
  Widget build(BuildContext context) {
    final step = recipeData.steps[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeStepTag(index: index, recipeData: recipeData),
        Divider(),
        Text(step.description, style: TextTheme.of(context).bodyLarge),
        if (step.ingredients.isNotEmpty) ...[
          Divider(),
          IngredientsList(ingredients: step.ingredients),
        ],
      ],
    );
  }
}
