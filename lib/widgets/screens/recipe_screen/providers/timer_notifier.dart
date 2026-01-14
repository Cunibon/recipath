import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/data/timer_data/timer_data.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/timer_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'timer_notifier.g.dart';

@riverpod
class TimerNotifier extends _$TimerNotifier {
  static const timerDataKey = "timerData_v5";

  @override
  Map<String, TimerData> build() {
    final data = localStorage.get<Map<String, dynamic>>(timerDataKey) ?? {};

    return data.map((key, value) => MapEntry(key, TimerData.fromJson(value)));
  }

  void start(String recipeId, int? servings) {
    state[recipeId] = TimerData(
      startTime: DateTime.now(),
      servings: servings,
      runningSteps: {},
    );
    WakelockPlus.enable();
    showTimersRunningNotification();
    _updateState();
  }

  void stop(String recipeId) {
    state.remove(recipeId);
    if (state.isEmpty) {
      ref
          .read(quickFilterProvider.notifier)
          .setFilter(filter: QuickFilters.running, value: false);
      cancelTimersNotification();
      for (final step
          in ref.read(recipeProvider).value?[recipeId]?.steps ??
              <RecipeStepData>[]) {
        cancelNotification(step.hashCode);
      }
      WakelockPlus.disable();
    }
    _updateState();
  }

  void adjustServings(String recipeId, int? servings) {
    if (state.containsKey(recipeId)) {
      state[recipeId] = state[recipeId]!.copyWith(servings: servings);

      _updateState();
    }
  }

  void addStep(RecipeData recipeData, int index) {
    if (state.containsKey(recipeData.id)) {
      final currentData = state[recipeData.id]!;
      final runningSteps = Map<String, DateTime>.from(currentData.runningSteps);

      final step = recipeData.steps[index];

      final plannedTime = DateTime.now().add(
        Duration(minutes: step.minutes ?? 0),
      );

      state[recipeData.id] = currentData.copyWith(
        runningSteps: runningSteps..[step.id] = plannedTime,
      );

      if (step.minutes != null) {
        scheduleStepNotification(
          id: step.hashCode,
          index: index,
          recipe: recipeData,
          scheduledAt: plannedTime,
        );
      }

      _updateState();
    }
  }

  void finishStep(String recipeId, RecipeStepData step) {
    if (state.containsKey(recipeId)) {
      final currentData = state[recipeId]!;
      final runningSteps = Map<String, DateTime>.from(currentData.runningSteps);

      state[recipeId] = currentData.copyWith(
        runningSteps: runningSteps..[step.id] = DateTime.now(),
      );

      _updateState();
    }
  }

  void removestep(String recipeId, RecipeStepData step) {
    if (state.containsKey(recipeId)) {
      final currentData = state[recipeId]!;
      final runningSteps = Map<String, DateTime>.from(currentData.runningSteps);

      state[recipeId] = currentData.copyWith(
        runningSteps: runningSteps..remove(step.id),
      );

      if (step.minutes != null) {
        cancelNotification(step.hashCode);
      }

      _updateState();
    }
  }

  void moveTimer({required RecipeData newData, required RecipeData oldData}) {
    if (state.containsKey(oldData.id)) {
      state[newData.id] = state.remove(oldData.id)!;

      _updateState();
    }
  }

  void _updateState() {
    localStorage.setItem(
      timerDataKey,
      jsonEncode(state.map((key, value) => MapEntry(key, value.toJson()))),
    );
    ref.invalidateSelf();
  }
}
