import 'package:drift/drift.dart';

class GroceryTable extends Table {
  @override
  Set<Column<Object>> get primaryKey => {id};

  TextColumn get id => text()();
  RealColumn get normalAmount => real()();
  TextColumn get unit => text()();
  RealColumn get conversionAmount => real()();
  TextColumn get conversionUnit => text()();
  TextColumn get name => text()();
}
