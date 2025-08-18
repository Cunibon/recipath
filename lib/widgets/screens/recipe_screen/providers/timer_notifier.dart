import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_notifier.g.dart';

@riverpod
class TimerNotifier extends _$TimerNotifier {
  @override
  Map<String, DateTime> build() {
    final data = localStorage.getItem(timerDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.map(
      (key, value) => MapEntry(key, DateTime.parse(value)),
    );
  }

  void start(String recipeId) {
    state[recipeId] = DateTime.now();
    updateState();
  }

  void stop(String recipeId) {
    state.remove(recipeId);
    updateState();
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
      jsonEncode(
        state.map((key, value) => MapEntry(key, value.toIso8601String())),
      ),
    );
    ref.invalidateSelf();
  }
}
