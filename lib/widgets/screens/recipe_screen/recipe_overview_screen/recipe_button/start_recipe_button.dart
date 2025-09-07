import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';

class StartRecipeButton extends ConsumerWidget {
  const StartRecipeButton({
    required this.recipeId,
    required this.servings,
    super.key,
  });

  final String recipeId;
  final int? servings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () =>
          ref.read(timerNotifierProvider.notifier).start(recipeId, servings),
      child: Icon(Icons.timer),
    );
  }
}
