import 'package:drift/drift.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class ShoppingRepoDrift extends Repo<ShoppingData> {
  ShoppingRepoDrift(super.db);

  @override
  $ShoppingTableTable get table => db.shoppingTable;
  @override
  JoinedSelectStatement get baseQuery => db.select(table).join([
    leftOuterJoin(
      db.ingredientTable,
      table.ingredientId.equalsExp(db.ingredientTable.id),
    ),
  ]);

  Map<String, ShoppingData> mapResult(List<TypedResult> rows) {
    final Map<String, ShoppingData> shoppingById = {};

    for (final row in rows) {
      final shoppingRow = row.readTable(table);
      final ingredientRow = row.readTable(db.ingredientTable);

      shoppingById[shoppingRow.id] = ShoppingData(
        id: shoppingRow.id,
        done: shoppingRow.done,
        count: shoppingRow.count,
        ingredient: IngredientData.fromRow(ingredientRow),
      );
    }
    return shoppingById;
  }

  @override
  Future<Map<String, ShoppingData>> get() async {
    final rows = await baseQuery.get();
    return mapResult(rows);
  }

  @override
  Stream<Map<String, ShoppingData>> stream() {
    return baseQuery.watch().map(mapResult);
  }

  @override
  Future<void> add(ShoppingData newData) async {
    await db.transaction(() async {
      await db
          .into(db.ingredientTable)
          .insert(
            newData.ingredient.toTableCompanion(),
            mode: InsertMode.insertOrReplace,
          );

      await db
          .into(table)
          .insert(newData.toTableCompanion(), mode: InsertMode.insertOrReplace);
    });
  }

  @override
  Future<void> delete(String id) async {
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id = (SELECT ${table.ingredientId.name} FROM ${table.actualTableName} WHERE id = ?)',
      [id],
    );
  }

  @override
  Future<void> clear() async {
    await db.delete(table).go();
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id IN (SELECT ${table.ingredientId.name} FROM ${table.actualTableName})',
    );
  }
}
