import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_notifier.g.dart';

@riverpod
class ShoppingNotifier extends _$ShoppingNotifier {
  @override
  Map<String, ShoppingData> build() {
    final data = localStorage.getItem(recipeDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.cast<String, ShoppingData>();
  }

  void addShoppingItem(ShoppingData newData) {
    state[newData.id] = newData;
    updateState();
  }

  void deleteShoppingItem(ShoppingData toDelete) {
    state.remove(toDelete.id);
    updateState();
  }

  void updateState() {
    localStorage.setItem(recipeDataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
