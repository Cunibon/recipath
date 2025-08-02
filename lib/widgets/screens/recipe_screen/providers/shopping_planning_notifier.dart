import 'package:recipe_list/data/recipe_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_planning_notifier.g.dart';

@riverpod
class ShoppingPlanningNotifier extends _$ShoppingPlanningNotifier {
  @override
  Map<RecipeData, int>? build() => null;

  void start() => state = {};

  void addRecipe(RecipeData data) {
    final stateCopy = Map<RecipeData, int>.from(state ?? {});
    final currentCount = stateCopy.putIfAbsent(data, () => 0);
    stateCopy[data] = currentCount + 1;

    state = stateCopy;
  }

  void removeRecipe(RecipeData data) {
    final stateCopy = Map<RecipeData, int>.from(state ?? {});
    final currentCount = stateCopy[data];
    if (currentCount != null) {
      if (currentCount <= 1) {
        stateCopy.remove(data);
      } else {
        stateCopy[data] = currentCount - 1;
      }

      if (stateCopy.isEmpty) {
        state = null;
      } else {
        state = stateCopy;
      }
    }
  }

  void clear() {
    state = null;
  }
}
