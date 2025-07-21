import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
class RecipeNotifier extends _$RecipeNotifier {
  @override
  Future<Stream<Map<String, RecipeData>>> build() async {
    final db = await ref.watch(databaseNotifierProvider.future);

    final query = db.select(db.recipeTable).join([
      leftOuterJoin(
        db.recipeStepTable,
        db.recipeStepTable.recipeId.equalsExp(db.recipeTable.id),
      ),
      leftOuterJoin(
        db.ingredientTable,
        db.ingredientTable.recipeStepId.equalsExp(db.recipeStepTable.id),
      ),
    ]);

    query.orderBy([
      OrderingTerm.asc(db.recipeStepTable.id),
      OrderingTerm.asc(db.recipeStepTable.index),
      OrderingTerm.asc(db.ingredientTable.index),
    ]);

    return query.watch().map((rows) {
      final Map<String, RecipeData> recipesById = {};

      for (final row in rows) {
        final recipeRow = row.readTable(db.recipeTable);
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
    });
  }

  Future<void> add(RecipeData newData) async {
    final db = await ref.read(databaseNotifierProvider.future);
    await db.transaction(() async {
      await db
          .into(db.recipeTable)
          .insert(
            RecipeTableCompanion(
              id: Value(newData.id),
              title: Value(newData.title),
              imageName: Value(newData.imageName),
            ),
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
            );

        for (int y = 0; y < step.ingredients.length; y++) {
          final ingredient = step.ingredients[y];
          await db
              .into(db.ingredientTable)
              .insert(
                IngredientTableCompanion.insert(
                  id: ingredient.id,
                  amount: ingredient.amount,
                  unit: ingredient.unit.name,
                  groceryId: ingredient.groceryId,
                  recipeStepId: Value(step.id),
                  index: Value(y),
                ),
              );
        }
      }
    });
  }

  Future<void> delete(String id) async {
    final db = await ref.read(databaseNotifierProvider.future);
    await (db.delete(db.recipeTable)..where((t) => t.id.equals(id))).go();
  }
}
