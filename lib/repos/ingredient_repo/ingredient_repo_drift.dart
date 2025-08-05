import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class IngredientRepoDrift extends Repo<IngredientData> {
  IngredientRepoDrift(super.db);

  @override
  $IngredientTableTable get table => db.ingredientTable;
  @override
  SimpleSelectStatement<$IngredientTableTable, IngredientTableData>
  get baseQuery => db.select(table);

  @override
  Future<Map<String, IngredientData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {for (final row in rows) row.id: IngredientData.fromTableData(row)};
  }

  @override
  Future<Map<String, IngredientData>> get() async {
    final rows = await baseQuery.get();
    return {for (final row in rows) row.id: IngredientData.fromTableData(row)};
  }

  @override
  Stream<Map<String, IngredientData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows) row.id: IngredientData.fromTableData(row),
      };
    });
  }

  @override
  Future<void> add(IngredientData newData) async {
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
