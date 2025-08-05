import 'package:drift/drift.dart';
import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/recipe_statistics/recipe_statistics_repo.dart';

class RecipeStatisticsRepoDrift extends RecipeStatisticsRepo {
  RecipeStatisticsRepoDrift(super.db);

  @override
  $RecipeStatisticTableTable get table => db.recipeStatisticTable;

  @override
  SimpleSelectStatement<$RecipeStatisticTableTable, RecipeStatisticTableData>
  get baseQuery {
    final query = db.select(table);

    query.orderBy([
      (u) => OrderingTerm(expression: u.startDate, mode: OrderingMode.desc),
    ]);
    return query;
  }

  @override
  Future<Map<String, RecipeStatisticData>> getNotUploaded() async {
    final rows = await (baseQuery..where((tbl) => tbl.uploaded.equals(false)))
        .get();
    return {
      for (final row in rows) row.id: RecipeStatisticData.fromTableData(row),
    };
  }

  @override
  Future<Map<String, RecipeStatisticData>> get() async {
    final rows = await baseQuery.get();
    return {
      for (final row in rows) row.id: RecipeStatisticData.fromTableData(row),
    };
  }

  @override
  Stream<Map<String, RecipeStatisticData>> stream() {
    return baseQuery.watch().map((rows) {
      return {
        for (final row in rows) row.id: RecipeStatisticData.fromTableData(row),
      };
    });
  }

  @override
  Stream<Duration?> getAverageTimeForRecipe(String recipeId) {
    final stream = db
        .customSelect(
          '''
          SELECT AVG(${table.endDate.name} - ${table.startDate.name}) as averageduration
          FROM ${table.actualTableName}
          WHERE ${table.recipeId.name} = ?
          ''',
          variables: [Variable(recipeId)],
          readsFrom: {table},
        )
        .watchSingle();

    return stream.map((event) {
      final avgMillis = event.data['averageduration'] as double?;
      return avgMillis != null
          ? Duration(milliseconds: avgMillis.round())
          : null;
    });
  }

  @override
  Future<Map<String, int>> getRecipeCountBetween({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final rows = await db
        .customSelect(
          '''
    SELECT ${table.recipeId.name}, COUNT(*) AS count
    FROM ${table.actualTableName}
    WHERE ${table.startDate.name} >= ? AND ${table.startDate.name} <= ?
    GROUP BY ${table.recipeId.name}
    ''',
          variables: [
            Variable(startDate.millisecondsSinceEpoch),
            Variable(endDate.millisecondsSinceEpoch),
          ],
          readsFrom: {table},
        )
        .get();

    final Map<String, int> result = {};
    for (final row in rows) {
      final recipeId = row.data[table.recipeId.name] as String;
      final count = row.data['count'] as int;
      result[recipeId] = count;
    }
    return result;
  }

  @override
  Future<Map<String, Map<String, Map<String, double>>>>
  getGroceryAmountBetween({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final rows = await db
        .customSelect(
          '''
    SELECT 
      rs.${db.recipeStatisticTable.recipeId.name} AS recipeId, 
      i.${db.ingredientTable.groceryId.name} AS groceryId, 
      i.${db.ingredientTable.unit.name} AS ingredientUnit,
      SUM(i.${db.ingredientTable.amount.name}) AS totalAmount
    FROM ${db.recipeStatisticTable.actualTableName} rs
    JOIN ${db.recipeStepTable.actualTableName} steps
      ON steps.${db.recipeStepTable.recipeId.name} = rs.${db.recipeStatisticTable.recipeId.name}
    JOIN ${db.recipeStepIngredientTable.actualTableName} rsi
      ON rsi.${db.recipeStepIngredientTable.stepId.name} = steps.${db.recipeStepTable.id.name}
    JOIN ${db.ingredientTable.actualTableName} i
      ON i.${db.ingredientTable.id.name} = rsi.${db.recipeStepIngredientTable.ingredientId.name}
    WHERE rs.${db.recipeStatisticTable.startDate.name} >= ?
      AND rs.${db.recipeStatisticTable.startDate.name} <= ?
    GROUP BY rs.${db.recipeStatisticTable.recipeId.name}, i.${db.ingredientTable.groceryId.name}, i.${db.ingredientTable.unit.name}
    ''',
          variables: [
            Variable(startDate.millisecondsSinceEpoch),
            Variable(endDate.millisecondsSinceEpoch),
          ],
          readsFrom: {
            db.recipeStatisticTable,
            db.recipeStepTable,
            db.recipeStepIngredientTable,
            db.ingredientTable,
          },
        )
        .get();

    final Map<String, Map<String, Map<String, double>>> result = {};
    for (final row in rows) {
      final recipeId = row.data['recipeId'] as String;
      final groceryMap = result.putIfAbsent(
        recipeId,
        () => <String, Map<String, double>>{},
      );

      final groceryId = row.data['groceryId'] as String;
      final ingredientMap = groceryMap.putIfAbsent(
        groceryId,
        () => <String, double>{},
      );
      ingredientMap[row.data['ingredientUnit']] =
          (row.data['totalAmount'] ?? 0);
    }
    return result;
  }

  @override
  Future<void> add(RecipeStatisticData newData) async {
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
