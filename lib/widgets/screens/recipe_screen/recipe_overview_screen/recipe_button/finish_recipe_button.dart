import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/recipe_statistics_modifier%20copy/recipe_statistics_modifier_notifier.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/count_up_timer.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/duration_picker_dialog.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';

class FinishRecipeButton extends ConsumerWidget {
  const FinishRecipeButton({
    required this.timerData,
    required this.recipeId,
    super.key,
  });

  final TimerData timerData;
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final recipeDateRange = DateTimeRange(
          start: timerData.startTime,
          end: DateTime.now(),
        );

        final durationResponse = await showDialog<DurationPickerResponse>(
          context: context,
          builder: (context) =>
              DurationPickerDialog(startDuration: recipeDateRange.duration),
        );

        if (durationResponse == null) return;

        ref.read(timerNotifierProvider.notifier).stop(recipeId);

        if (durationResponse.duration == null) return;

        final recipe = ref
            .read(
              recipeNotifierProvider.select((value) => value.value?[recipeId]),
            )!
            .adjustIngredientForPlannedServings(timerData.servings);
        final groceries = ref.read(groceryNotifierProvider).value!;
        final ingredients = recipe.getIngredients(groceries);

        ref
            .read(recipeStatisticsModifierNotifierProvider)
            .add(
              RecipeStatisticData(
                id: randomAlphaNumeric(16),
                startDate: recipeDateRange.start,
                endDate: recipeDateRange.start.add(durationResponse.duration!),
                recipeId: recipe.id,
              ),
            );

        final ingredientsInStorage = Map<String, StorageData>.from(
          ref.read(storageNotifierProvider).value!,
        );
        final availableIngredients = ingredients.where(
          (e) => ingredientsInStorage.keys.contains(e.groceryId),
        );

        for (final storageItem in availableIngredients) {
          ref.read(storageModifierNotifierProvider).subtractItem(storageItem);
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                AppLocalizations.of(context)!.removedIngredientsFromStorage,
              ),
            ),
          );
        }
      },
      label: Row(
        children: [
          CountUpTimer(startTime: timerData.startTime),
          SizedBox(width: 20),
          Icon(Icons.check),
        ],
      ),
    );
  }
}
