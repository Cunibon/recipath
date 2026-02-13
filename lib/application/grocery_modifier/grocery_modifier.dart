import 'package:drift/drift.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class GroceryModifier {
  GroceryModifier(this.repo);
  final LocalRepo<GroceryData> repo;

  Future<void> add(GroceryData newData) =>
      repo.add(newData.copyWith(uploaded: false));

  Future<void> archive(GroceryData toArchive) =>
      (repo.db.update(
        repo.db.groceryTable,
      )..where((tbl) => tbl.id.equals(toArchive.id))).write(
        GroceryTableCompanion(archived: Value(true), uploaded: Value(false)),
      );
}
