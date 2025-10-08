import 'package:drift/drift.dart';
import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/repo.dart';

class RecipeTagModifier {
  RecipeTagModifier(this.repo);
  final Repo<RecipeTagData> repo;

  Future<void> add(RecipeTagData newData) => repo.add(newData);

  Future<void> delete(RecipeTagData toDelete) =>
      (repo.db.update(repo.db.recipeTagTable)..where(
            (tbl) =>
                tbl.recipeId.equals(toDelete.recipeId) &
                tbl.tagId.equals(toDelete.tagId),
          ))
          .write(
            RecipeTagTableCompanion(
              deleted: Value(true),
              uploaded: Value(false),
            ),
          );
}
