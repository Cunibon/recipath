import 'package:drift/drift.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/tag_filtered_repo.dart';

class GroceryRepoDrift extends TagFilteredRepo<GroceryData> {
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
  Future<List<GroceryTableData>> getNotUploaded() async {
    return await (db.select(
      table,
    )..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Stream<bool> hasNotUploaded() {
    return (db.select(table)
          ..where((tbl) => tbl.uploaded.equals(false))
          ..limit(1))
        .watchSingleOrNull()
        .map((e) => e != null);
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

  @override
  Stream<Map<String, GroceryData>> streamFiltered(Set<String> tagDataFilters) {
    final query = baseQuery;

    query.where((tbl) => tbl.archived.equals(false));

    if (tagDataFilters.isNotEmpty) {
      final requiredTagIds = tagDataFilters;

      final tagSubquery = db.selectOnly(db.groceryTagTable)
        ..addColumns([db.groceryTagTable.groceryId])
        ..where(db.groceryTagTable.tagId.isIn(requiredTagIds))
        ..groupBy(
          [db.groceryTagTable.groceryId],
          having: db.groceryTagTable.tagId
              .count(distinct: true)
              .equals(requiredTagIds.length),
        );
      query.where((tbl) => tbl.id.isInQuery(tagSubquery));
    }

    return query.watch().map(
      (event) => {
        for (final row in event) row.id: GroceryData.fromTableData(row),
      },
    );
  }
}
