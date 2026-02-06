import 'package:drift/drift.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/recipe/recipe_repo.dart';

class RecipeRepoDrift extends RecipeRepo {
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
        return RecipeData.fromTableData(recipeRow);
      });

      if (stepRow != null) {
        late RecipeStepData recipeStep;

        if (recipe.steps.lastOrNull?.id != stepRow.id) {
          recipeStep = RecipeStepData.fromTable(stepRow);
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
                    IngredientData.fromTableData(ingredientRow),
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
  Future<List<RecipeTableData>> getNotUploaded() async {
    final query = db.select(table);

    if (!incluedArchived) {
      query.where((tbl) => tbl.archived.equals(false));
    }

    return (query..where((tbl) => tbl.uploaded.equals(false))).get();
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
  Stream<Map<String, RecipeData>> streamFiltered(Set<String> tagDataFilters) {
    final query = baseQuery;

    query.where(table.archived.equals(false));

    if (tagDataFilters.isNotEmpty) {
      final requiredTagIds = tagDataFilters;

      final tagSubquery = db.selectOnly(db.recipeTagTable)
        ..addColumns([db.recipeTagTable.recipeId])
        ..where(db.recipeTagTable.tagId.isIn(requiredTagIds))
        ..groupBy(
          [db.recipeTagTable.recipeId],
          having: db.recipeTagTable.tagId
              .count(distinct: true)
              .equals(requiredTagIds.length),
        );
      query.where(table.id.isInQuery(tagSubquery));
    }

    return query.watch().map(mapResult);
  }

  @override
  Future<void> add(RecipeData newData) async {
    await db.transaction(() async {
      await db
          .into(table)
          .insertOnConflictUpdate(
            RecipeTableCompanion.insert(
              id: newData.id,
              parent: Value(newData.parent),
              title: newData.title,
              servings: Value(newData.servings),
              imageName: Value(newData.imageName),
              archived: Value(newData.archived),
              uploaded: Value(newData.uploaded),
            ),
          );

      for (int i = 0; i < newData.steps.length; i++) {
        final step = newData.steps[i];
        await db
            .into(db.recipeStepTable)
            .insertOnConflictUpdate(
              RecipeStepTableCompanion.insert(
                id: step.id,
                description: step.description,
                recipeId: newData.id,
                minutes: Value(step.minutes),
                index: i,
                uploaded: Value(newData.uploaded),
              ),
            );

        for (int y = 0; y < step.ingredients.length; y++) {
          final ingredient = step.ingredients[y];
          await db
              .into(db.ingredientTable)
              .insertOnConflictUpdate(
                ingredient
                    .copyWith(uploaded: newData.uploaded)
                    .toTableCompanion(),
              );

          await db
              .into(db.recipeStepIngredientTable)
              .insertOnConflictUpdate(
                RecipeStepIngredientTableCompanion.insert(
                  stepId: step.id,
                  ingredientId: ingredient.id,
                  index: y,
                  uploaded: Value(newData.uploaded),
                ),
              );
        }
      }
    });
  }

  @override
  Future<void> delete(RecipeData toDelete) async {
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
      [toDelete.id],
    );
    await (db.delete(table)..where((t) => t.id.equals(toDelete.id))).go();
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
