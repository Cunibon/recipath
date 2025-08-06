import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/sync_repo.dart';

class StorageRepoDrift extends SyncRepo<StorageData> {
  StorageRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $StorageTableTable get table => db.storageTable;
  @override
  JoinedSelectStatement get baseQuery {
    final query = db.select(table).join([
      leftOuterJoin(
        db.ingredientTable,
        table.ingredientId.equalsExp(db.ingredientTable.id),
      ),
    ]);

    if (!incluedDeleted) {
      query.where(table.deleted.equals(false));
    }

    return query;
  }

  Map<String, StorageData> mapResult(List<TypedResult> rows) {
    final Map<String, StorageData> storageById = {};

    for (final row in rows) {
      final storageRow = row.readTable(table);
      final ingredientRow = row.readTable(db.ingredientTable);

      final ingredient = IngredientData.fromTableData(ingredientRow);

      storageById[ingredientRow.groceryId] = StorageData.fromTableData(
        storageRow,
        ingredient,
      );
    }
    return storageById;
  }

  @override
  Future<Map<String, StorageData>> getNotUploaded() async {
    final rows = await (baseQuery..where(table.uploaded.equals(false))).get();
    return mapResult(rows);
  }

  @override
  Future<Map<String, StorageData>> get() async {
    final rows = await baseQuery.get();
    return mapResult(rows);
  }

  @override
  Stream<Map<String, StorageData>> stream() {
    return baseQuery.watch().map(mapResult);
  }

  @override
  Future<void> add(StorageData newData) async {
    await db.transaction(() async {
      await db
          .into(db.ingredientTable)
          .insert(
            newData.ingredient.toTableCompanion(),
            mode: InsertMode.insertOrReplace,
          );

      await db
          .into(table)
          .insert(newData.toTableCompanion(), mode: InsertMode.insertOrReplace);
    });
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.ingredientId.equals(id))).go();
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id = (SELECT ${table.ingredientId.name} FROM ${table.actualTableName} WHERE id = ?)',
      [id],
    );
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id IN (SELECT ${table.ingredientId.name} FROM ${table.actualTableName})',
    );
  }
}
