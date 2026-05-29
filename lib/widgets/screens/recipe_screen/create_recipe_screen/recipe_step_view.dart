import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/recipe_step_item.dart';

class RecipeStepView extends StatelessWidget {
  const RecipeStepView({
    required this.steps,
    required this.onChanged,
    this.header,
    this.footer,
    this.controller,
    super.key,
  });

  final Widget? header;
  final Widget? footer;

  final IList<RecipeStepData> steps;
  final void Function(IList<RecipeStepData> newSteps) onChanged;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];
    for (int i = 0; i < steps.length; i++) {
      final step = steps[i];
      items.add(
        RecipeStepItem(
          key: Key(step.id),
          index: i,
          data: step,
          controller: controller,
          delete: () {
            onChanged(steps.removeAt(i));
          },
          onChanged: (newStep) {
            onChanged(steps.replace(i, newStep));
          },
        ),
      );
    }

    return ReorderableListView(
      header: header,
      footer: footer,
      scrollController: controller,
      shrinkWrap: true,
      children: items,
      onReorderItem: (int oldIndex, int newIndex) {
        final removedValue = Output<RecipeStepData>();
        final removedList = steps.removeAt(oldIndex, removedValue);
        onChanged(removedList.insert(newIndex, removedValue.value!));
      },
    );
  }
}
