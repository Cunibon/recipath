import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_notifier.g.dart';

@Riverpod(keepAlive: true)
class ShoppingNotifier extends _$ShoppingNotifier {
  @override
  Stream<Map<String, ShoppingData>> build() {
    final repo = ref.watch(shoppingRepoNotifierProvider);
    return repo.stream();
  }

  Future<void> addItems(
    Iterable<IngredientData> newData,
    Map<String, GroceryData> groceryMap,
  ) async {
    final value = state.value;

    if (value == null) return;

    final List<ShoppingData> newShoppingData = [];
    final List<IngredientData> notDone = [];

    for (final entry in value.entries) {
      if (entry.value.done) {
        newShoppingData.add(entry.value);
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
      newShoppingData.add(shoppingData);
    }

    //TODO could be optimized
    for (final data in newShoppingData) {
      await updateItem(data);
    }
  }

  Future<void> updateItem(ShoppingData updated) async {
    final repo = ref.read(shoppingRepoNotifierProvider);
    await repo.add(updated);
  }

  Future<void> deleteItem(ShoppingData toDelete) async {
    final repo = ref.read(shoppingRepoNotifierProvider);
    await repo.delete(toDelete.id);
  }

  Future<void> clear() async {
    final repo = ref.read(shoppingRepoNotifierProvider);
    await repo.clear();
  }
}
