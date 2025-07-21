import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/grocery_table.dart';
import 'package:recipe_list/drift/tables/recipe_step_table.dart';

@TableIndex(name: 'ingredients_recipeStepId', columns: {#recipeStepId})
class IngredientTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  RealColumn get amount => real()();
  TextColumn get unit => text()();
  TextColumn get groceryId => text().references(GroceryTable, #id)();

  TextColumn get recipeStepId => text()
      .references(RecipeStepTable, #id, onDelete: KeyAction.cascade)
      .nullable()();
  IntColumn get index => integer().nullable()();
}
