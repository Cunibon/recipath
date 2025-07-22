import 'package:drift/drift.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class GroceryRepoDrift extends Repo<GroceryData> {
  GroceryRepoDrift(super.db);

  @override
  $GroceryTableTable get table => db.groceryTable;

  @override
  Stream<Map<String, GroceryData>> stream() {
    final query = db.select(table);

    return query.watch().map((rows) {
      return {for (final row in rows) row.id: GroceryData.fromRow(row)};
    });
  }

  @override
  Future<void> add(GroceryData newData) async {
    await db
        .into(table)
        .insert(
          GroceryTableCompanion.insert(
            id: newData.id,
            normalAmount: newData.normalAmount,
            unit: newData.unit.name,
            conversionAmount: newData.conversionAmount,
            conversionUnit: newData.conversionUnit.name,
            name: newData.name,
          ),
          mode: InsertMode.insertOrReplace,
        );
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
