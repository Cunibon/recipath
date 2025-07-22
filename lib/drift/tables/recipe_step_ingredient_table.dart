import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/ingredient_table.dart';
import 'package:recipe_list/drift/tables/recipe_step_table.dart';

class RecipeStepIngredientTable extends Table {
  @override
  Set<Column> get primaryKey => {stepId, ingredientId};

  TextColumn get stepId =>
      text().references(RecipeStepTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get ingredientId => text().references(IngredientTable, #id)();
  IntColumn get index => integer()();
}
