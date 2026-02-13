import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/repo.dart';

class IngredientRepoDrift extends Repo {
  IngredientRepoDrift(super.db);

  @override
  $IngredientTableTable get table => db.ingredientTable;
  @override
  SimpleSelectStatement<$IngredientTableTable, IngredientTableData>
  get baseQuery => db.select(table);

  @override
  Future<List<IngredientTableData>> getNotUploaded() async {
    return (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }
}
