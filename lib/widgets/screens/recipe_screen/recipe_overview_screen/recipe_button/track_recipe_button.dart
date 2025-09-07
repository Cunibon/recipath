import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/finish_recipe_button.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/start_recipe_button.dart';

class TrackRecipeButton extends ConsumerWidget {
  const TrackRecipeButton({required this.recipeData, super.key});

  final RecipeData recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerNotifierProvider)[recipeData.id];

    return timer == null
        ? StartRecipeButton(
            recipeId: recipeData.id,
            servings: recipeData.servings,
          )
        : FinishRecipeButton(timerData: timer, recipeId: recipeData.id);
  }
}
