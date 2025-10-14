import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/timer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_overview_screen_notifier.g.dart';

@riverpod
class RecipeOverviewScreenNotifier extends _$RecipeOverviewScreenNotifier {
  @override
  Future<RecipeOverviewScreenState> build(String recipeId) async {
    final originalData = await ref.watch(
      recipeProvider.selectAsync((value) => value[recipeId]!),
    );

    final timer = ref.watch(timerProvider)[recipeId];
    final recipeData = originalData.adjustIngredientForPlannedServings(
      timer?.servings ?? originalData.servings,
    );

    final tags = ref.watch(
      tagsPerRecipeProvider.select((data) => data.value?[recipeId]),
    );

    return RecipeOverviewScreenState(
      originalData: originalData,
      recipeData: recipeData,
      timer: timer,
      tags: tags ?? {},
    );
  }

  void adjustServings(int servings) {
    final recipeData = state.value!.originalData
        .adjustIngredientForPlannedServings(servings);
    ref.read(timerProvider.notifier).adjustServings(recipeData.id, servings);

    state = AsyncValue.data(
      RecipeOverviewScreenState(
        originalData: state.value!.originalData,
        recipeData: recipeData,
        timer: state.value!.timer,
        tags: state.value!.tags,
      ),
    );
  }
}

class RecipeOverviewScreenState {
  RecipeOverviewScreenState({
    required this.originalData,
    required this.recipeData,
    required this.timer,
    required this.tags,
  });

  final RecipeData originalData;
  final RecipeData recipeData;
  final TimerData? timer;
  final Set<TagData> tags;
}
