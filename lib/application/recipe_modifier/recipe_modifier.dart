import 'package:drift/drift.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeModifier {
  RecipeModifier(this.repo);
  final Repo<RecipeData> repo;

  Future<void> add(RecipeData newData) =>
      repo.add(newData.copyWith(uploaded: false));

  Future<void> replace({
    required RecipeData newData,
    required RecipeData oldData,
  }) async {
    await repo.add(newData.copyWith(uploaded: false));
    await delete(oldData);
  }

  Future<void> delete(RecipeData toDelete) =>
      (repo.db.update(
        repo.db.recipeTable,
      )..where((tbl) => tbl.id.equals(toDelete.id))).write(
        RecipeTableCompanion(archived: Value(true), uploaded: Value(false)),
      );
}
