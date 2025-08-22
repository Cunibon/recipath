import 'package:flutter/material.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/ingredients_list.dart';

class RecipeStep extends StatelessWidget {
  const RecipeStep({required this.index, required this.step, super.key});

  final int index;
  final RecipeStepData step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${AppLocalizations.of(context)!.step} ${index + 1}:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
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
