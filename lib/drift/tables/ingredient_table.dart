import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/grocery_table.dart';

@TableIndex(name: 'ingredient_groceryId', columns: {#groceryId})
class IngredientTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  RealColumn get amount => real()();
  TextColumn get unit => text()();
  TextColumn get groceryId => text().references(GroceryTable, #id)();

  BoolColumn get uploaded => boolean().withDefault(const Constant(false))();
}
