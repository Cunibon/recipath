import 'package:drift/drift.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class GroceryModifier {
  GroceryModifier(this.repo);
  final Repo<GroceryData> repo;

  Future<void> add(GroceryData newData) =>
      repo.add(newData.copyWith(uploaded: false));

  Future<void> archive(GroceryData toDelete) =>
      (repo.db.update(
        repo.db.groceryTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        GroceryTableCompanion(archived: Value(true), uploaded: Value(false)),
      );
}
