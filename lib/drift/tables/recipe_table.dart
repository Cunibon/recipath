import 'package:drift/drift.dart';

@TableIndex(name: 'recipe_uploaded', columns: {#uploaded})
class RecipeTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get parent => text().nullable()();
  TextColumn get title => text()();
  IntColumn get servings => integer().nullable()();
  TextColumn get imageName => text().nullable()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(const Constant(false))();
}
