import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/ingredient_table.dart';

@TableIndex(name: 'shopping_ingredientId', columns: {#ingredientId})
class ShoppingTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  BoolColumn get done => boolean()();
  IntColumn get count => integer()();
  TextColumn get ingredientId =>
      text().references(IngredientTable, #id, onDelete: KeyAction.cascade)();
}
