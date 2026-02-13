import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/repo.dart';

class RecipeStepRepoDrift extends Repo {
  RecipeStepRepoDrift(super.db);

  @override
  $RecipeStepTableTable get table => db.recipeStepTable;
  @override
  SimpleSelectStatement<$RecipeStepTableTable, RecipeStepTableData>
  get baseQuery => db.select(table);

  @override
  Future<List<RecipeStepTableData>> getNotUploaded() async {
    return (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }
}
