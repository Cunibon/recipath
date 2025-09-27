import 'package:drift/drift.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/repo.dart';

class TagModifier {
  TagModifier(this.repo);
  final Repo<TagData> repo;

  Future<void> addItem(TagData newData) => repo.add(newData);

  Future<void> updateItem(TagData updated) =>
      repo.add(updated.copyWith(uploaded: false));

  Future<void> deleteItem(TagData toDelete) =>
      (repo.db.update(
        repo.db.tagTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        TagTableCompanion(deleted: Value(true), uploaded: Value(false)),
      );
}
