import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipe_step_recipeId', columns: {#recipeId})
class RecipeStepTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get description => text()();
  IntColumn get index => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
}
