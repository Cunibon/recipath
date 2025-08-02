import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/recipe_statistics_modifier%20copy/recipe_statistics_modifier_notifier.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_statistic_data.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/count_up_timer.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/duration_picker_dialog.dart';
import 'package:recipe_list/widgets/screens/storage_screen/providers/storage_notifier.dart';

class FinishRecipeButton extends ConsumerWidget {
  const FinishRecipeButton({
    required this.timerStartTime,
    required this.recipeId,
    super.key,
  });

  final DateTime timerStartTime;
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final scaffoldMessenger = ScaffoldMessenger.of(context);

        final recipeDateRange = DateTimeRange(
          start: ref.read(timerNotifierProvider)[recipeId]!,
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

        final recipe = ref.read(
          recipeNotifierProvider.select((value) => value.value?[recipeId]),
        );
        final groceries = ref.read(groceryNotifierProvider).value!;
        final ingredients = recipe!.getIngredients(groceries);

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

        final ingredientsInStorage = Map<String, IngredientData>.from(
          ref.read(storageNotifierProvider).value!,
        );
        final availableIngredients = ingredients.where(
          (e) => ingredientsInStorage.keys.contains(e.groceryId),
        );

        for (final ingredient in availableIngredients) {
          ref.read(storageModifierNotifierProvider).subtractItem(ingredient);
        }

        scaffoldMessenger.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 5),
            content: Text("Removed ingredients from storage!"),
          ),
        );
      },
      label: Row(
        children: [
          CountUpTimer(startTime: timerStartTime),
          SizedBox(width: 20),
          Icon(Icons.check),
        ],
      ),
    );
  }
}
