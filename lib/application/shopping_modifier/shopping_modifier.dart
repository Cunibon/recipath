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

    final groceryLookup = value.map(
      (key, value) => MapEntry(value.ingredient.groceryId, value),
    );

    final List<ShoppingData> newShoppingData = [];

    for (final ingredient in newData) {
      final shoppingData = groceryLookup[ingredient.groceryId];
      final grocery = groceryMap[ingredient.groceryId]!;

      if (shoppingData == null || shoppingData.done) {
        newShoppingData.add(
          ShoppingData(
            id: randomAlphaNumeric(16),
            done: false,
            count: (ingredient.amount / grocery.normalAmount).ceil(),
            ingredient: ingredient.copyWith(id: randomAlphaNumeric(16)),
          ),
        );
      } else {
        final updatedIngredient = shoppingData.ingredient.copyWith(
          amount: shoppingData.ingredient.amount + ingredient.amount,
        );
        newShoppingData.add(
          shoppingData.copyWith(
            count: (updatedIngredient.amount / grocery.normalAmount).ceil(),
            ingredient: updatedIngredient,
          ),
        );
      }
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
