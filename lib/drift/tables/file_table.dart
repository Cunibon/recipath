import 'package:drift/drift.dart';

@TableIndex(name: 'fileTable_uploaded', columns: {#uploaded})
class FileTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {fileName};

  TextColumn get fileName => text()();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
