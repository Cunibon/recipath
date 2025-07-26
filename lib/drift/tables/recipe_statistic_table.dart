import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipeStatistics_recipeId', columns: {#recipeId})
class RecipeStatisticTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  IntColumn get startDate => integer()();
  IntColumn get endDate => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();
}
