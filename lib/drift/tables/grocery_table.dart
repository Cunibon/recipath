import 'package:drift/drift.dart';

@TableIndex(name: 'grocery_uploaded', columns: {#uploaded})
class GroceryTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get normalAmount => real()();
  TextColumn get unit => text()();
  RealColumn get conversionAmount => real()();
  TextColumn get conversionUnit => text()();
  TextColumn get barcode => text().nullable()();
  RealColumn get kcal => real().nullable()();
  RealColumn get fat => real().nullable()();
  RealColumn get carbs => real().nullable()();
  RealColumn get protein => real().nullable()();
  RealColumn get fiber => real().nullable()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  BoolColumn get uploaded => boolean().withDefault(Constant(false))();
}
