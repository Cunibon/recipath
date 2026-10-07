import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo.dart';

class IngredientRepoDrift extends IngredientRepo {
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

  @override
  Stream<ISet<String>> streamUsedGroceryIds() {
    final groceryId = table.groceryId;
    final query =
        db.selectOnly(db.recipeTable, distinct: true).join([
            innerJoin(
              db.recipeStepTable,
              db.recipeStepTable.recipeId.equalsExp(db.recipeTable.id),
              useColumns: false,
            ),
            innerJoin(
              db.recipeStepIngredientTable,
              db.recipeStepIngredientTable.stepId.equalsExp(
                db.recipeStepTable.id,
              ),
              useColumns: false,
            ),
            innerJoin(
              table,
              table.id.equalsExp(db.recipeStepIngredientTable.ingredientId),
              useColumns: false,
            ),
          ])
          ..addColumns([groceryId])
          ..where(db.recipeTable.archived.equals(false));

    return query.watch().map(
      (rows) => {for (final row in rows) row.read(groceryId)!}.lock,
    );
  }
}
