import 'package:drift/drift.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/sync_repo.dart';

class GroceryRepoDrift extends SyncRepo<GroceryData> {
  GroceryRepoDrift(super.db, {this.incluedArchived = false});
  final bool incluedArchived;

  @override
  $GroceryTableTable get table => db.groceryTable;
  @override
  SimpleSelectStatement<$GroceryTableTable, GroceryTableData> get baseQuery {
    final query = db.select(table);

    if (!incluedArchived) {
      query.where((tbl) => tbl.archived.equals(false));
    }

    return query;
  }

  @override
  Future<Map<String, GroceryData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {for (final row in rows) row.id: GroceryData.fromTableData(row)};
  }

  @override
  Future<Map<String, GroceryData>> get() async {
    final rows = await baseQuery.get();
    return {for (final row in rows) row.id: GroceryData.fromTableData(row)};
  }

  @override
  Stream<Map<String, GroceryData>> stream() {
    return baseQuery.watch().map((rows) {
      return {for (final row in rows) row.id: GroceryData.fromTableData(row)};
    });
  }

  @override
  Future<void> add(GroceryData newData) async {
    await db
        .into(table)
        .insert(newData.toTableCompanion(), mode: InsertMode.insertOrReplace);
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
