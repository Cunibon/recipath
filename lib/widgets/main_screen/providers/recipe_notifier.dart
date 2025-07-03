import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
class RecipeNotifier extends _$RecipeNotifier {
  @override
  Map<String, RecipeData> build() {
    final data = localStorage.getItem(recipeDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.map(
      (key, value) => MapEntry(key, RecipeData.fromJson(value)),
    );
  }

  void addRecipe(RecipeData newData) {
    state[newData.id] = newData;
    updateState();
  }

  void deleteRecipe(RecipeData toDelete) {
    state.remove(toDelete.id);
    updateState();
  }

  void updateState() {
    localStorage.setItem(recipeDataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
