import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/ingredient_table.dart';

@TableIndex(name: 'storage_uploaded', columns: {#uploaded})
class StorageTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {ingredientId};

  TextColumn get id => text()();
  TextColumn get ingredientId =>
      text().references(IngredientTable, #id, onDelete: KeyAction.cascade)();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
