import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/count_down_timer.dart';

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
    final localization = AppLocalizations.of(context)!;

    final runningTimer = ref.watch(
      timerProvider.select((p) => p[recipeData.id]),
    );
    final step = recipeData.steps[index];
    final runningStep = runningTimer?.runningSteps[step.id];

    return GestureDetector(
      onTap: () async {
        if (runningStep == null) {
          ref.read(timerProvider.notifier).addStep(recipeData.id, step);
        } else if (DateTime.now().isAfter(runningStep)) {
          ref.read(timerProvider.notifier).removestep(recipeData.id, step);
        } else {
          final result = await showDialog<bool>(
            context: context,
            builder: (context) => TwoOptionDialog(
              title: localization.cancelTimer,
              agree: localization.yes,
              disagree: localization.no,
            ),
          );

          if (result == true) {
            ref.read(timerProvider.notifier).removestep(recipeData.id, step);
          }
        }
      },
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
            if (runningTimer != null)
              if (runningStep == null)
                Icon(Icons.check_box_outline_blank)
              else if (DateTime.now().isAfter(runningStep))
                Icon(Icons.check_box)
              else
                CountDownTimer(
                  endTime: runningStep,
                  style: TextTheme.of(
                    context,
                  ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  onDone: () => ref
                      .read(timerProvider.notifier)
                      .finishStep(recipeData.id, step),
                ),
            Text(
              "${AppLocalizations.of(context)!.step} ${index + 1}:",
              style: TextTheme.of(context).titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
