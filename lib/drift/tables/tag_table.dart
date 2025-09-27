import 'package:drift/drift.dart';

@TableIndex(name: 'tag_uploaded', columns: {#uploaded})
class TagTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get color => integer()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
