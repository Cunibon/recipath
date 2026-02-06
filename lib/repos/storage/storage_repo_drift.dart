import 'package:drift/drift.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class StorageRepoDrift extends LocalRepo<StorageData> {
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

      storageById[ingredient.groceryId] = StorageData.fromTableData(
        storageRow,
        ingredient,
      );
    }
    return storageById;
  }

  @override
  Future<List<StorageTableData>> getNotUploaded() async {
    final query = db.select(table);

    if (!incluedDeleted) {
      query.where((tbl) => tbl.deleted.equals(false));
    }

    return await (query..where((tbl) => tbl.uploaded.equals(false))).get();
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
          .insertOnConflictUpdate(
            newData.ingredient.copyWith(uploaded: false).toTableCompanion(),
          );

      await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
    });
  }

  @override
  Future<void> delete(String id) async {
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id = (SELECT ${table.ingredientId.name} FROM ${table.actualTableName} WHERE id = ?)',
      [id],
    );
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id IN (SELECT ${table.ingredientId.name} FROM ${table.actualTableName})',
    );
    await db.delete(table).go();
  }
}
