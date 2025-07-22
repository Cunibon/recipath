import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class StorageRepoDrift extends Repo<IngredientData> {
  StorageRepoDrift(super.db);

  @override
  $IngredientTableTable get table => db.ingredientTable;

  @override
  Stream<Map<String, IngredientData>> stream() {
    final query = db.select(table);

    return query.watch().map((rows) {
      return {
        for (final row in rows) row.groceryId: IngredientData.fromRow(row),
      };
    });
  }

  @override
  Future<void> add(IngredientData newData) async {
    await db
        .into(table)
        .insert(
          IngredientTableCompanion.insert(
            id: newData.id,
            amount: newData.amount,
            unit: newData.unit.name,
            groceryId: newData.groceryId,
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
