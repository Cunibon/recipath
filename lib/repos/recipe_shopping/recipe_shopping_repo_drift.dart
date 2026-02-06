import 'package:drift/drift.dart';
import 'package:recipath/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class RecipeShoppingRepoDrift extends LocalRepo<RecipeShoppingData> {
  RecipeShoppingRepoDrift(super.db);

  @override
  $RecipeShoppingTableTable get table => db.recipeShoppingTable;

  @override
  SimpleSelectStatement<$RecipeShoppingTableTable, RecipeShoppingTableData>
  get baseQuery {
    final query = db.select(table);

    query.orderBy([
      (u) => OrderingTerm(expression: u.date, mode: OrderingMode.desc),
    ]);
    return query;
  }

  @override
  Future<List<RecipeShoppingTableData>> getNotUploaded() async {
    return await (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Future<Map<String, RecipeShoppingData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows) row.id: RecipeShoppingData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, RecipeShoppingData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows) row.id: RecipeShoppingData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(RecipeShoppingData newData) async {
    await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
  }

  @override
  Future<void> delete(RecipeShoppingData toDelete) async {
    await (db.delete(table)..where((t) => t.id.equals(toDelete.id))).go();
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
  }
}
