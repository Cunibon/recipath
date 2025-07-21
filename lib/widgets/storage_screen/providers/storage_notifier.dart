import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_notifier.g.dart';

@riverpod
class StorageNotifier extends _$StorageNotifier {
  @override
  Map<String, IngredientData> build() {
    final data = localStorage.getItem(storageDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    return decodedData.map(
      (key, value) => MapEntry(key, IngredientData.fromJson(value)),
    );
  }

  void addItem(IngredientData newData) {
    final item = state.putIfAbsent(
      newData.groceryId,
      () => IngredientData(
        id: randomAlphaNumeric(16),
        amount: 0,
        unit: newData.unit,
        groceryId: newData.groceryId,
      ),
    );

    state[newData.groceryId] = item.copyWith(
      amount: item.amount + newData.amount,
    );
    updateState();
  }

  void subtractItem(IngredientData newData) {
    final item = state[newData.groceryId];

    if (item == null) return;

    final newItem = item.copyWith(amount: item.amount - newData.amount);

    if (newItem.amount <= 0) {
      state.remove(item.groceryId);
    } else {
      state[newData.groceryId] = item.copyWith(
        amount: item.amount - newData.amount,
      );
    }

    updateState();
  }

  void updateItem(IngredientData updated) {
    state[updated.groceryId] = updated;
    updateState();
  }

  void deleteItem(IngredientData toDelete) {
    state.remove(toDelete.groceryId);
    updateState();
  }

  void clear() {
    state.clear();
    updateState();
  }

  void updateState() {
    localStorage.setItem(storageDataKey, jsonEncode(state));
    ref.invalidateSelf();
  }
}
