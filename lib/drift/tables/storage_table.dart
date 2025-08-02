import 'package:drift/drift.dart';
import 'package:recipe_list/drift/tables/ingredient_table.dart';

@TableIndex(name: 'storage_uploaded', columns: {#uploaded})
class StorageTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {ingredientId};

  TextColumn get ingredientId =>
      text().references(IngredientTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
