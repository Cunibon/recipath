import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/repos/repo.dart';

class ShoppingModifier {
  ShoppingModifier(this.repo);
  final Repo<ShoppingData> repo;

  Future<void> addItems(
    Iterable<IngredientData> newData,
    Map<String, GroceryData> groceryMap,
  ) async {
    final value = await repo.get();

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

  Future<void> updateItem(ShoppingData updated) => repo.add(updated);

  Future<void> deleteItem(ShoppingData toDelete) => repo.delete(toDelete.id);

  Future<void> clear() => repo.clear();
}
