import 'package:flutter/material.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/recipe_step_item.dart';

class RecipeStepView extends StatelessWidget {
  const RecipeStepView({
    required this.steps,
    required this.onChanged,
    super.key,
  });

  final List<RecipeStepData> steps;
  final void Function(List<RecipeStepData> newSteps) onChanged;

  @override
  Widget build(BuildContext context) {
    final listCopy = List<RecipeStepData>.from(steps);

    final List<Widget> items = [];
    for (int i = 0; i < steps.length; i++) {
      final step = steps[i];
      items.add(
        RecipeStepItem(
          key: Key(step.id),
          index: i,
          data: step,
          onChanged: (newStep) {
            listCopy.removeAt(i);
            listCopy.insert(i, newStep);
            onChanged(listCopy);
          },
        ),
      );
    }

    return ReorderableListView(
      children: items,
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = listCopy.removeAt(oldIndex);
        listCopy.insert(newIndex, item);
        onChanged(listCopy);
      },
    );
  }
}
