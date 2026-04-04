import 'package:drift/drift.dart';
import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class GroceryTagRepoDrift extends LocalRepo<GroceryTagData> {
  GroceryTagRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $GroceryTagTableTable get table => db.groceryTagTable;
  @override
  SimpleSelectStatement<$GroceryTagTableTable, GroceryTagTableData>
  get baseQuery {
    final query = db.select(table);

    if (!incluedDeleted) {
      query.where((tbl) => tbl.deleted.equals(false));
    }

    return query;
  }

  @override
  Future<List<GroceryTagTableData>> getNotUploaded() async {
    return await (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Future<Map<String, GroceryTagData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows)
        "${row.groceryId}_${row.tagId}": GroceryTagData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, GroceryTagData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows)
          "${row.groceryId}_${row.tagId}": GroceryTagData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(GroceryTagData newData) async {
    await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
  }

  @override
  Future<void> delete(String id) async {
    final parts = id.split("_");

    await (db.delete(table)..where(
          (t) => t.groceryId.equals(parts.first) & t.tagId.equals(parts.last),
        ))
        .go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
