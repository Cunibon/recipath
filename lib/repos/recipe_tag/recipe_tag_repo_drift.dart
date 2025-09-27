import 'package:drift/drift.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/sync_repo.dart';

class RecipeTagRepoDrift extends SyncRepo<RecipeTagData> {
  RecipeTagRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $RecipeTagTableTable get table => db.recipeTagTable;
  @override
  SimpleSelectStatement<$RecipeTagTableTable, RecipeTagTableData>
  get baseQuery => db.select(table);

  @override
  Future<Map<String, RecipeTagData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {
      for (final row in rows) row.recipeId: RecipeTagData.fromTableData(row),
    };
  }

  @override
  Future<Map<String, RecipeTagData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows) row.recipeId: RecipeTagData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, RecipeTagData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows) row.recipeId: RecipeTagData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(RecipeTagData newData) async {
    await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.recipeId.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
