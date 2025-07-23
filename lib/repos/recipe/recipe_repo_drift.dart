import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeRepoDrift extends Repo<RecipeData> {
  RecipeRepoDrift(super.db);

  @override
  $RecipeTableTable get table => db.recipeTable;

  @override
  JoinedSelectStatement get query {
    final query = db.select(table).join([
      leftOuterJoin(
        db.recipeStepTable,
        db.recipeStepTable.recipeId.equalsExp(table.id),
      ),
      leftOuterJoin(
        db.recipeStepIngredientTable,
        db.recipeStepIngredientTable.stepId.equalsExp(db.recipeStepTable.id),
      ),
      leftOuterJoin(
        db.ingredientTable,
        db.ingredientTable.id.equalsExp(
          db.recipeStepIngredientTable.ingredientId,
        ),
      ),
    ]);

    query.orderBy([
      OrderingTerm.asc(db.recipeStepTable.id),
      OrderingTerm.asc(db.recipeStepTable.index),
      OrderingTerm.asc(db.recipeStepIngredientTable.index),
    ]);
    return query;
  }

  Map<String, RecipeData> mapResult(List<TypedResult> rows) {
    final Map<String, RecipeData> recipesById = {};

    for (final row in rows) {
      final recipeRow = row.readTable(table);
      final stepRow = row.readTableOrNull(db.recipeStepTable);

      final recipe = recipesById.putIfAbsent(recipeRow.id, () {
        return RecipeData.fromRow(recipeRow);
      });

      if (stepRow != null) {
        late RecipeStepData recipeStep;

        if (recipe.steps.lastOrNull?.id != stepRow.id) {
          recipeStep = RecipeStepData.fromRow(stepRow);
          recipe.steps.add(recipeStep);
        } else {
          recipeStep = recipe.steps.last;
        }

        final ingredientRow = row.readTableOrNull(db.ingredientTable);

        if (ingredientRow != null) {
          recipeStep.ingredients.add(IngredientData.fromRow(ingredientRow));
        }
      }
    }

    return recipesById;
  }

  @override
  Future<Map<String, RecipeData>> get() async {
    final rows = await query.get();
    return mapResult(rows);
  }

  @override
  Stream<Map<String, RecipeData>> stream() {
    return query.watch().map(mapResult);
  }

  @override
  Future<void> add(RecipeData newData) async {
    await db.transaction(() async {
      await db
          .into(table)
          .insert(
            RecipeTableCompanion(
              id: Value(newData.id),
              title: Value(newData.title),
              imageName: Value(newData.imageName),
            ),
            mode: InsertMode.insertOrReplace,
          );

      for (int i = 0; i < newData.steps.length; i++) {
        final step = newData.steps[i];
        await db
            .into(db.recipeStepTable)
            .insert(
              RecipeStepTableCompanion.insert(
                id: step.id,
                description: step.description,
                recipeId: newData.id,
                index: i,
              ),
              mode: InsertMode.insertOrReplace,
            );

        for (int y = 0; y < step.ingredients.length; y++) {
          final ingredient = step.ingredients[y];
          await db
              .into(db.ingredientTable)
              .insert(
                ingredient.toTableCompanion(),
                mode: InsertMode.insertOrReplace,
              );

          await db
              .into(db.recipeStepIngredientTable)
              .insert(
                RecipeStepIngredientTableCompanion.insert(
                  stepId: step.id,
                  ingredientId: ingredient.id,
                  index: y,
                ),
                mode: InsertMode.insertOrReplace,
              );
        }
      }
    });
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
