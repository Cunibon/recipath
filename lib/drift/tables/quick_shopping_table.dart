import 'package:drift/drift.dart';

@TableIndex(name: 'quick_shopping_uploaded', columns: {#uploaded})
class QuickShoppingTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  BoolColumn get done => boolean()();
  TextColumn get description => text()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
