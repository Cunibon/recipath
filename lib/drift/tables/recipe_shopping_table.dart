import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipeShopping_recipeId', columns: {#recipeId})
class RecipeShoppingTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  IntColumn get date => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
}
