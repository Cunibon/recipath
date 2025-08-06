import 'package:drift/drift.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class StorageModifier {
  StorageModifier(this.repo);
  final Repo<StorageData> repo;

  Future<void> addItem(IngredientData newData) async {
    final value = await repo.get();

    final item = value[newData.groceryId];

    final ingredient =
        item?.ingredient ??
        IngredientData(
          id: randomAlphaNumeric(16),
          amount: 0,
          unit: newData.unit,
          groceryId: newData.groceryId,
          uploaded: false,
        );

    final aggregated = ingredient.copyWith(
      amount: ingredient.amount + newData.amount,
      uploaded: false,
    );

    if (item == null) {
      repo.add(
        StorageData(
          id: randomAlphaNumeric(16),
          ingredient: aggregated,
          uploaded: false,
        ),
      );
    } else {
      repo.add(item.copyWith(ingredient: aggregated, uploaded: false));
    }
  }

  Future<void> subtractItem(IngredientData newData) async {
    final value = await repo.get();

    final item = value[newData.groceryId];
    if (item == null) return;

    final ingredient = item.ingredient;

    final newIngredient = ingredient.copyWith(
      amount: ingredient.amount - newData.amount,
      uploaded: false,
    );

    if (newIngredient.amount <= 0) {
      await deleteItem(item);
    } else {
      await updateItem(item.copyWith(ingredient: newIngredient));
    }
  }

  Future<void> updateItem(StorageData updated) =>
      repo.add(updated.copyWith(uploaded: false));

  Future<void> deleteItem(StorageData toDelete) =>
      (repo.db.update(
        repo.db.storageTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        StorageTableCompanion(deleted: Value(true), uploaded: Value(false)),
      );

  Future<void> clear() => repo.db
      .update(repo.db.storageTable)
      .write(
        StorageTableCompanion(deleted: Value(true), uploaded: Value(false)),
      );
}
