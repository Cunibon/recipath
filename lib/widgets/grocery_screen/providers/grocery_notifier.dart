import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_notifier.g.dart';

@riverpod
class GroceryNotifier extends _$GroceryNotifier {
  @override
  Map<String, GroceryData> build() {
    final data = localStorage.getItem(groceryDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.map(
      (key, value) => MapEntry(key, GroceryData.fromJson(value)),
    );
  }

  void add(GroceryData newData) {
    state[newData.id] = newData;
    updateState();
  }

  void delete(GroceryData toDelete) {
    state.remove(toDelete.id);
    updateState();
  }

  void updateState() {
    localStorage.setItem(groceryDataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
