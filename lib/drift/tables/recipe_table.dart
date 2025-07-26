import 'package:drift/drift.dart';

class RecipeTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get imageName => text().nullable()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
}
