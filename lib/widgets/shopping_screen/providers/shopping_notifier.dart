import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_notifier.g.dart';

@riverpod
class ShoppingNotifier extends _$ShoppingNotifier {
  @override
  Future<Map<String, ShoppingData>> build() async {
    final data = localStorage.getItem(shoppingDataKey);

    if (data == null) return {};

    final decodedData = jsonDecode(data) as Map<String, dynamic>;
    for (final shopping in decodedData.entries) {
      final ingredient = shopping.value["ingredient"];
      if (ingredient["id"] == null) {
        ingredient["id"] = randomAlphaNumeric(16);
      }
    }
    final entries = decodedData.values.map(
      (value) => ShoppingData.fromJson(value),
    );
  }

  void addItems(
    Iterable<IngredientData> newData,
    Map<String, GroceryData> groceryMap,
  ) {
    final Map<String, ShoppingData> newState = {};
    final List<IngredientData> notDone = [];

    for (final entry in state.entries) {
      if (entry.value.done) {
        newState[entry.key] = entry.value;
      } else {
        notDone.add(entry.value.ingredient);
      }
    }

    final ingredients = IngredientData.aggregateIngredients(
      groceryMap,
      notDone..addAll(newData),
    );

    for (final ingredient in ingredients) {
      final grocery = groceryMap[ingredient.groceryId]!;
      final shoppingData = ShoppingData(
        id: randomAlphaNumeric(16),
        done: false,
        count: (ingredient.amount / grocery.normalAmount).ceil(),
        ingredient: ingredient,
      );
      newState[shoppingData.id] = shoppingData;
    }

    state = newState;
    updateState();
  }

  void updateItem(ShoppingData updated) {
    state[updated.id] = updated;
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
