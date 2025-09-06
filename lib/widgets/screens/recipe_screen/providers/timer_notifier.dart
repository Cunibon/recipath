import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_notifier.g.dart';

@riverpod
class TimerNotifier extends _$TimerNotifier {
  static const timerDataKey = "timerData_v2";

  @override
  Map<String, TimerData> build() {
    final data = localStorage.get<Map<String, dynamic>>(timerDataKey) ?? {};

    return data.map((key, value) => MapEntry(key, TimerData.fromJson(value)));
  }

  void start(String recipeId, int? servings) {
    state[recipeId] = TimerData(startTime: DateTime.now(), servings: servings);
    updateState();
  }

  void stop(String recipeId) {
    state.remove(recipeId);
    if (state.isEmpty) {
      ref
          .read(quickFilterNotifierProvider.notifier)
          .setFilter(filter: QuickFilters.running, value: false);
    }
    updateState();
  }

  void adjustServings(String recipeId, int? servings) {
    if (state.containsKey(recipeId)) {
      state[recipeId] = state[recipeId]!.copyWith(servings: servings);

      updateState();
    }
  }

  void moveTimer({required RecipeData newData, required RecipeData oldData}) {
    if (state.containsKey(oldData.id)) {
      state[newData.id] = state.remove(oldData.id)!;

      updateState();
    }
  }

  void updateState() {
    localStorage.setItem(
      timerDataKey,
      jsonEncode(state.map((key, value) => MapEntry(key, value.toJson()))),
    );
    ref.invalidateSelf();
  }
}
