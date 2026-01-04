import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';

class RecipeStepTag extends ConsumerWidget {
  const RecipeStepTag({
    required this.index,
    required this.recipeData,
    super.key,
  });

  final int index;
  final RecipeData recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider.select((p) => p[recipeData.id]));
    final step = recipeData.steps[index];
    final isDone = timer?.finishedSteps.contains(step.id) == true;

    return GestureDetector(
      onTap: () =>
          ref.read(timerProvider.notifier).toggleStep(recipeData.id, step.id),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (timer != null)
              Icon(isDone ? Icons.check_box : Icons.check_box_outline_blank),
            Text(
              "${AppLocalizations.of(context)!.step} ${index + 1}:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
