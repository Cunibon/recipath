import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/grocery_table.dart';

class IngredientTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  RealColumn get amount => real()();
  TextColumn get unit => text()();
  TextColumn get groceryId => text().references(GroceryTable, #id)();
}
