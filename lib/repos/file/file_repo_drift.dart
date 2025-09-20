import 'package:drift/drift.dart';
import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/sync_repo.dart';

class FileRepoDrift extends SyncRepo<FileData> {
  FileRepoDrift(super.db);

  @override
  $FileTableTable get table => db.fileTable;
  @override
  SimpleSelectStatement<$FileTableTable, FileTableData> get baseQuery =>
      db.select(table);

  @override
  Future<Map<String, FileData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {for (final row in rows) row.fileName: FileData.fromTableData(row)};
  }

  @override
  Future<Map<String, FileData>> get() async {
    final rows = await baseQuery.get();
    return {for (final row in rows) row.fileName: FileData.fromTableData(row)};
  }

  @override
  Stream<Map<String, FileData>> stream() {
    return baseQuery.watch().map(
      (rows) => {
        for (final row in rows) row.fileName: FileData.fromTableData(row),
      },
    );
  }

  @override
  Future<void> add(FileData newData) async {
    await db
        .into(table)
        .insertOnConflictUpdate(
          FileTableCompanion.insert(
            fileName: newData.fileName,
            uploaded: Value(newData.uploaded),
          ),
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
