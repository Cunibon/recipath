import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/sync_repo.dart';

class FileRepoDrift extends SyncRepo<FileTableData> {
  FileRepoDrift(super.db);

  @override
  $FileTableTable get table => db.fileTable;
  @override
  SimpleSelectStatement<$FileTableTable, FileTableData> get baseQuery =>
      db.select(table);

  @override
  Future<Map<String, FileTableData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {for (final row in rows) row.fileName: row};
  }

  @override
  Future<Map<String, FileTableData>> get() async {
    final rows = await baseQuery.get();
    return {for (final row in rows) row.fileName: row};
  }

  @override
  Stream<Map<String, FileTableData>> stream() {
    return baseQuery.watch().map(
      (rows) => {for (final row in rows) row.fileName: row},
    );
  }

  @override
  Future<void> add(FileTableData newData) async {
    await db
        .into(table)
        .insert(
          FileTableCompanion.insert(
            fileName: newData.fileName,
            uploaded: Value(newData.uploaded),
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> delete(String fileName) async {
    await (db.delete(table)..where((t) => t.fileName.equals(fileName))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
