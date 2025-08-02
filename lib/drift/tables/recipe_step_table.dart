import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipeStep_recipeId', columns: {#recipeId})
@TableIndex(name: 'recipeStep_uploaded', columns: {#uploaded})
class RecipeStepTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get description => text()();
  IntColumn get index => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
