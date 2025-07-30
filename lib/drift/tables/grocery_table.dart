import 'package:drift/drift.dart';

class GroceryTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get normalAmount => real()();
  TextColumn get unit => text()();
  RealColumn get conversionAmount => real()();
  TextColumn get conversionUnit => text()();
  RealColumn get kcal => real().nullable()();
  RealColumn get fat => real().nullable()();
  RealColumn get carbs => real().nullable()();
  RealColumn get protein => real().nullable()();
  RealColumn get fiber => real().nullable()();
}
