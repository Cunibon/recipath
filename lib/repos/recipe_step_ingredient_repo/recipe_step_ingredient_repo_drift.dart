import 'package:drift/drift.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/repo.dart';

class RecipeStepIngredientRepoDrift extends Repo {
  RecipeStepIngredientRepoDrift(super.db);

  @override
  $RecipeStepIngredientTableTable get table => db.recipeStepIngredientTable;
  @override
  SimpleSelectStatement<
    $RecipeStepIngredientTableTable,
    RecipeStepIngredientTableData
  >
  get baseQuery => db.select(table);

  @override
  Future<List<RecipeStepIngredientTableData>> getNotUploaded() async {
    return (baseQuery..where((tbl) => tbl.uploaded.equals(false))).get();
  }
}
