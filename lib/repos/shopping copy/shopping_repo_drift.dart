import 'package:drift/drift.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/tag_filtered_repo.dart';

class ShoppingRepoDrift extends TagFilteredRepo<ShoppingData> {
  ShoppingRepoDrift(super.db, {this.incluedDeleted = false});
  final bool incluedDeleted;

  @override
  $ShoppingTableTable get table => db.shoppingTable;
  @override
  JoinedSelectStatement get baseQuery {
    final query = db.select(table).join([
      leftOuterJoin(
        db.ingredientTable,
        table.ingredientId.equalsExp(db.ingredientTable.id),
      ),
    ]);

    if (!incluedDeleted) {
      query.where(table.deleted.equals(false));
    }

    return query;
  }

  Map<String, ShoppingData> mapResult(List<TypedResult> rows) {
    final Map<String, ShoppingData> shoppingById = {};

    for (final row in rows) {
      final shoppingRow = row.readTable(table);
      final ingredientRow = row.readTable(db.ingredientTable);

      shoppingById[shoppingRow.id] = ShoppingData.fromTableData(
        shoppingRow,
        IngredientData.fromTableData(ingredientRow),
      );
    }
    return shoppingById;
  }

  @override
  Future<List<ShoppingTableData>> getNotUploaded() async {
    return await (db.select(
      table,
    )..where((tbl) => tbl.uploaded.equals(false))).get();
  }

  @override
  Stream<bool> hasNotUploaded() {
    return (db.select(table)
          ..where((tbl) => tbl.uploaded.equals(false))
          ..limit(1))
        .watchSingleOrNull()
        .map((e) => e != null);
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
          .insertOnConflictUpdate(
            newData.ingredient.copyWith(uploaded: false).toTableCompanion(),
          );

      await db.into(table).insertOnConflictUpdate(newData.toTableCompanion());
    });
  }

  @override
  Future<void> delete(String id) async {
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id = (SELECT ${table.ingredientId.name} FROM ${table.actualTableName} WHERE id = ?)',
      [id],
    );
    await (db.delete(table)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> clear() async {
    await db.customStatement(
      'DELETE FROM ${db.ingredientTable.actualTableName} WHERE id IN (SELECT ${table.ingredientId.name} FROM ${table.actualTableName})',
    );
    await db.delete(table).go();
  }

  @override
  Stream<Map<String, ShoppingData>> streamFiltered(Set<String> tagDataFilters) {
    final query = baseQuery;

    if (tagDataFilters.isNotEmpty) {
      final requiredTagIds = tagDataFilters;

      final grocerySubquery = db.selectOnly(db.groceryTagTable)
        ..addColumns([db.groceryTagTable.groceryId])
        ..where(db.groceryTagTable.tagId.isIn(requiredTagIds))
        ..groupBy(
          [db.groceryTagTable.groceryId],
          having: db.groceryTagTable.tagId
              .count(distinct: true)
              .equals(requiredTagIds.length),
        );

      final ingredientSubquery = db.selectOnly(db.ingredientTable)
        ..addColumns([db.ingredientTable.id])
        ..where(db.ingredientTable.groceryId.isInQuery(grocerySubquery));

      query.where(table.ingredientId.isInQuery(ingredientSubquery));
    }

    return query.watch().map(mapResult);
  }
}
