import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeRepoDrift extends Repo<RecipeData> {
  RecipeRepoDrift(super.db, {this.incluedArchived = false});
  final bool incluedArchived;

  @override
  $RecipeTableTable get table => db.recipeTable;

  @override
  JoinedSelectStatement get baseQuery {
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

    if (!incluedArchived) {
      query.where(table.archived.equals(false));
    }

    query.orderBy([
      OrderingTerm.asc(db.recipeTable.id),
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
          recipesById[recipe.id] = recipesById[recipe.id]!.copyWith(
            steps: [...recipesById[recipe.id]!.steps, recipeStep],
          );
        } else {
          recipeStep = recipe.steps.last;
        }

        final ingredientRow = row.readTableOrNull(db.ingredientTable);

        if (ingredientRow != null) {
          recipesById[recipe.id] = recipesById[recipe.id]!.copyWith(
            steps: List.from(recipesById[recipe.id]!.steps)
              ..removeLast()
              ..add(
                recipeStep.copyWith(
                  ingredients: [
                    ...recipeStep.ingredients,
                    IngredientData.fromRow(ingredientRow),
                  ],
                ),
              ),
          );
        }
      }
    }

    return recipesById;
  }

  @override
  Future<Map<String, RecipeData>> get() async {
    final rows = await baseQuery.get();
    return mapResult(rows);
  }

  @override
  Stream<Map<String, RecipeData>> stream() {
    return baseQuery.watch().map(mapResult);
  }

  @override
  Future<void> add(RecipeData newData) async {
    await db.transaction(() async {
      await db
          .into(table)
          .insert(
            RecipeTableCompanion.insert(
              id: newData.id,
              title: newData.title,
              servings: Value(newData.servings),
              imageName: Value(newData.imageName),
              archived: Value(newData.archived),
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
    await db.customStatement(
      '''
      DELETE FROM ${db.ingredientTable.actualTableName} 
      WHERE id IN 
      (SELECT rsi.${db.recipeStepIngredientTable.ingredientId.name} 
      FROM ${table.actualTableName} AS r
      LEFT JOIN ${db.recipeStepTable.actualTableName} AS rs
      ON r.${table.id.name} = rs.${db.recipeStepTable.recipeId.name}
      LEFT JOIN ${db.recipeStepIngredientTable.actualTableName} AS rsi
      ON rs.${db.recipeStepTable.id.name} = rsi.${db.recipeStepIngredientTable.stepId.name}
      WHERE r.id = ?
      )''',
      [id],
    );
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.customStatement('''
      DELETE FROM ${db.ingredientTable.actualTableName} 
      WHERE id IN 
      (SELECT rsi.${db.recipeStepIngredientTable.ingredientId.name} 
      FROM ${table.actualTableName} AS r
      LEFT JOIN ${db.recipeStepTable.actualTableName} AS rs
      ON r.${table.id.name} = rs.${db.recipeStepTable.recipeId.name}
      LEFT JOIN ${db.recipeStepIngredientTable.actualTableName} AS rsi
      ON rs.${db.recipeStepTable.id.name} = rsi.${db.recipeStepIngredientTable.stepId.name}
      )''');
    await db.delete(table).go();
  }
}
