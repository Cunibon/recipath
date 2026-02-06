import 'package:drift/drift.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class RecipeModifier {
  RecipeModifier(this.repo);
  final LocalRepo<RecipeData> repo;

  Future<void> add(RecipeData newData) =>
      repo.add(newData.copyWith(uploaded: false));

  Future<void> replace({
    required RecipeData newData,
    required RecipeData oldData,
  }) async {
    await repo.add(newData.copyWith(uploaded: false, parent: oldData.id));
    await archive(oldData);
  }

  Future<void> archive(RecipeData toDelete) =>
      (repo.db.update(
        repo.db.recipeTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        RecipeTableCompanion(archived: Value(true), uploaded: Value(false)),
      );
}
