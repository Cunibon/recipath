import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_overview_screen_notifier.g.dart';

@riverpod
class RecipeOverviewScreenNotifier extends _$RecipeOverviewScreenNotifier {
  @override
  RecipeOverviewScreenState build(String recipeId) {
    final originalData = ref.watch(
      recipeProvider.select((value) => value.value?[recipeId]),
    )!;

    final timer = ref.watch(timerProvider)[recipeId];
    final recipeData = originalData.adjustIngredientForPlannedServings(
      timer?.servings ?? originalData.servings,
    );

    return RecipeOverviewScreenState(
      originalData: originalData,
      recipeData: recipeData,
      timer: timer,
    );
  }

  void adjustServings(int servings) {
    final recipeData = state.originalData.adjustIngredientForPlannedServings(
      servings,
    );
    ref.read(timerProvider.notifier).adjustServings(recipeData.id, servings);

    state = RecipeOverviewScreenState(
      originalData: state.originalData,
      recipeData: recipeData,
      timer: state.timer,
    );
  }
}

class RecipeOverviewScreenState {
  RecipeOverviewScreenState({
    required this.originalData,
    required this.recipeData,
    required this.timer,
  });

  final RecipeData originalData;
  final RecipeData recipeData;
  final TimerData? timer;
}
