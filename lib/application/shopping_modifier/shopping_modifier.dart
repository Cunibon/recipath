import 'package:drift/drift.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/repo.dart';

class ShoppingModifier {
  ShoppingModifier(this.repo);
  final Repo<ShoppingData> repo;

  Future<void> addItems(
    Iterable<IngredientData> newData,
    Map<String, GroceryData> groceryMap,
  ) async {
    final currentShoppingData = await repo.get();

    final groceryLookup = currentShoppingData.map(
      (key, value) => MapEntry(value.ingredient.groceryId, value),
    );

    final Map<String, ShoppingData> newShoppingData = {};

    for (final ingredient in newData) {
      final shoppingData =
          groceryLookup[ingredient.groceryId] ??
          newShoppingData[ingredient.groceryId];
      final grocery = groceryMap[ingredient.groceryId]!;

      if (shoppingData == null || shoppingData.done) {
        newShoppingData[grocery.id] = ShoppingData(
          id: randomAlphaNumeric(16),
          done: false,
          count: (ingredient.amount / grocery.normalAmount).ceil(),
          ingredient: ingredient.copyWith(id: randomAlphaNumeric(16)),
        );
      } else {
        final updatedIngredient = shoppingData.ingredient.copyWith(
          amount: shoppingData.ingredient.amount + ingredient.amount,
        );
        newShoppingData[grocery.id] = shoppingData.copyWith(
          count: (updatedIngredient.amount / grocery.normalAmount).ceil(),
          ingredient: updatedIngredient,
          uploaded: false,
        );
      }
    }

    for (final data in newShoppingData.values) {
      await updateItem(data);
    }
  }

  Future<void> updateItem(ShoppingData updated) =>
      repo.add(updated.copyWith(uploaded: false));

  Future<void> deleteItem(ShoppingData toDelete) =>
      (repo.db.update(
        repo.db.shoppingTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        ShoppingTableCompanion(deleted: Value(true), uploaded: Value(false)),
      );

  Future<void> clear() => repo.db
      .update(repo.db.shoppingTable)
      .write(
        ShoppingTableCompanion(deleted: Value(true), uploaded: Value(false)),
      );
}
