import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/finish_recipe_button.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_overview_screen/recipe_button/start_recipe_button.dart';

class TrackRecipeButton extends ConsumerWidget {
  const TrackRecipeButton({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerNotifierProvider)[recipeId];

    return timer == null
        ? StartRecipeButton(recipeId: recipeId)
        : FinishRecipeButton(timerStartTime: timer, recipeId: recipeId);
  }
}
