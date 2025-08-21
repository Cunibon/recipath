import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipeShopping_recipeId', columns: {#recipeId})
@TableIndex(name: 'recipeShopping_uploaded', columns: {#uploaded})
class RecipeShoppingTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  IntColumn get date => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
