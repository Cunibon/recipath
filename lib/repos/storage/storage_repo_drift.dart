import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class StorageRepoDrift extends Repo<IngredientData> {
  StorageRepoDrift(super.db);

  @override
  $StorageTableTable get table => db.storageTable;
  @override
  JoinedSelectStatement get query => db.select(table).join([
    leftOuterJoin(
      db.ingredientTable,
      table.ingredientId.equalsExp(db.ingredientTable.id),
    ),
  ]);

  Map<String, IngredientData> mapResult(List<TypedResult> rows) {
    final Map<String, IngredientData> ingredientById = {};

    for (final row in rows) {
      final ingredientRow = row.readTable(db.ingredientTable);

      ingredientById[ingredientRow.groceryId] = IngredientData.fromRow(
        ingredientRow,
      );
    }
    return ingredientById;
  }

  @override
  Future<Map<String, IngredientData>> get() async {
    final rows = await query.get();
    return mapResult(rows);
  }

  @override
  Stream<Map<String, IngredientData>> stream() {
    return query.watch().map(mapResult);
  }

  @override
  Future<void> add(IngredientData newData) async {
    await db.transaction(() async {
      await db
          .into(db.ingredientTable)
          .insert(newData.toTableCompanion(), mode: InsertMode.insertOrReplace);

      await db
          .into(table)
          .insert(
            StorageTableCompanion.insert(ingredientId: newData.id),
            mode: InsertMode.insertOrReplace,
          );
    });
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.ingredientId.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
