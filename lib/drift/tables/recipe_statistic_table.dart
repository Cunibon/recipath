import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/recipe_table.dart';

@TableIndex(name: 'recipeStatistics_recipeId', columns: {#recipeId})
@TableIndex(name: 'recipeStatistics_uploaded', columns: {#uploaded})
class RecipeStatisticTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  IntColumn get startDate => integer()();
  IntColumn get endDate => integer()();

  TextColumn get recipeId =>
      text().references(RecipeTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
