import 'package:drift/drift.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class GroceryRepoDrift extends Repo<GroceryData> {
  GroceryRepoDrift(super.db);

  @override
  $GroceryTableTable get table => db.groceryTable;
  @override
  SimpleSelectStatement<$GroceryTableTable, GroceryTableData> get query =>
      db.select(table);

  @override
  Future<Map<String, GroceryData>> get() async {
    final rows = await query.get();
    return {for (final row in rows) row.id: GroceryData.fromRow(row)};
  }

  @override
  Stream<Map<String, GroceryData>> stream() {
    return query.watch().map((rows) {
      return {for (final row in rows) row.id: GroceryData.fromRow(row)};
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
