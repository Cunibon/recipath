import 'package:drift/drift.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class TagRepoDrift extends LocalRepo<TagData> {
  TagRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $TagTableTable get table => db.tagTable;
  @override
  SimpleSelectStatement<$TagTableTable, TagTableData> get baseQuery {
    final query = db.select(table);

    if (!incluedDeleted) {
      query.where((tbl) => tbl.deleted.equals(false));
    }

    return query;
  }

  @override
  Future<List<TagTableData>> getNotUploaded() async {
    return await (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Future<Map<String, TagData>> get() async {
    final rows = await (baseQuery).get();
    return {for (final row in rows) row.id: TagData.fromTableData(row)};
  }

  @override
  Stream<Map<String, TagData>> stream() {
    return baseQuery.watch().map((rows) {
      return {for (final row in rows) row.id: TagData.fromTableData(row)};
    });
  }

  @override
  Future<void> add(TagData newData) async {
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
