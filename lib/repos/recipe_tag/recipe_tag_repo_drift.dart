import 'package:drift/drift.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class RecipeTagRepoDrift extends LocalRepo<RecipeTagData> {
  RecipeTagRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $RecipeTagTableTable get table => db.recipeTagTable;
  @override
  SimpleSelectStatement<$RecipeTagTableTable, RecipeTagTableData>
  get baseQuery {
    final query = db.select(table);

    if (!incluedDeleted) {
      query.where((tbl) => tbl.deleted.equals(false));
    }

    return query;
  }

  @override
  Future<List<RecipeTagTableData>> getNotUploaded() async {
    return await (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Future<Map<String, RecipeTagData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows)
        "${row.recipeId}_${row.tagId}": RecipeTagData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, RecipeTagData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows)
          "${row.recipeId}_${row.tagId}": RecipeTagData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(RecipeTagData newData) async {
    await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
  }

  @override
  Future<void> delete(String id) async {
    final parts = id.split("_");

    await (db.delete(table)..where(
          (t) => t.recipeId.equals(parts.first) & t.tagId.equals(parts.last),
        ))
        .go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
