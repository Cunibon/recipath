import 'package:drift/drift.dart';
import 'package:recipath/drift/tables/grocery_table.dart';
import 'package:recipath/drift/tables/tag_table.dart';

@TableIndex(name: 'groceryTag_uploaded', columns: {#uploaded})
class GroceryTagTable extends Table {
  @override
  Set<Column> get primaryKey => {groceryId, tagId};

  TextColumn get groceryId =>
      text().references(GroceryTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get tagId =>
      text().references(TagTable, #id, onDelete: KeyAction.cascade)();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
