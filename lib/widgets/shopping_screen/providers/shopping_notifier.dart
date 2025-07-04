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
    final data = localStorage.getItem(shoppingDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.map(
      (key, value) => MapEntry(key, ShoppingData.fromJson(value)),
    );
  }

  void addItem(ShoppingData newData) {
    state[newData.id] = newData;
    updateState();
  }

  void deleteItem(ShoppingData toDelete) {
    state.remove(toDelete.id);
    updateState();
  }

  void clear() {
    state.clear();
    updateState();
  }

  void updateState() {
    localStorage.setItem(shoppingDataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
