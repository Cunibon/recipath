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
    final data = localStorage.getItem(dataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data);
    return decodedData;
  }

  void addRecipe(RecipeData newData) {
    state[newData.id] = newData;
    localStorage.setItem(dataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
