import 'package:drift/drift.dart';
import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class QuickShoppingRepoDrift extends LocalRepo<QuickShoppingData> {
  QuickShoppingRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $QuickShoppingTableTable get table => db.quickShoppingTable;
  @override
  SimpleSelectStatement<$QuickShoppingTableTable, QuickShoppingTableData>
  get baseQuery {
    final query = db.select(table);

    if (!incluedDeleted) {
      query.where((tbl) => tbl.deleted.equals(false));
    }

    return query;
  }

  @override
  Future<List<QuickShoppingTableData>> getNotUploaded() async {
    return await (db.select(
      table,
    )..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Stream<bool> hasNotUploaded() {
    return (db.select(table)..where((tbl) => tbl.uploaded.equals(false)))
        .watchSingleOrNull()
        .map((e) => e != null);
  }

  @override
  Future<Map<String, QuickShoppingData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows) row.id: QuickShoppingData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, QuickShoppingData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows) row.id: QuickShoppingData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(QuickShoppingData newData) async {
    await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
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
