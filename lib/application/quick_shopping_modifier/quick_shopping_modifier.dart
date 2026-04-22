import 'package:drift/drift.dart';
import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class QuickShoppingModifier {
  QuickShoppingModifier(this.repo);
  final LocalRepo<QuickShoppingData> repo;

  Future<void> add(QuickShoppingData newData) => repo.add(newData);

  Future<void> updateItem(QuickShoppingData updated) =>
      repo.add(updated.copyWith(uploaded: false));

  Future<void> deleteItem(QuickShoppingData toDelete) =>
      (repo.db.update(
        repo.db.quickShoppingTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        QuickShoppingTableCompanion(
          deleted: Value(true),
          uploaded: Value(false),
        ),
      );

  Future<void> clear() => repo.db
      .update(repo.db.quickShoppingTable)
      .write(
        QuickShoppingTableCompanion(
          deleted: Value(true),
          uploaded: Value(false),
        ),
      );
}
