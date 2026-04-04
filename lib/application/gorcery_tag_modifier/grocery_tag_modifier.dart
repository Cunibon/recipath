import 'package:drift/drift.dart';
import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class GroceryTagModifier {
  GroceryTagModifier(this.repo);
  final LocalRepo<GroceryTagData> repo;

  Future<void> add(GroceryTagData newData) => repo.add(newData);

  Future<void> delete(GroceryTagData toDelete) =>
      (repo.db.update(repo.db.recipeTagTable)..where(
            (tbl) =>
                tbl.recipeId.equals(toDelete.groceryId) &
                tbl.tagId.equals(toDelete.tagId),
          ))
          .write(
            RecipeTagTableCompanion(
              deleted: Value(true),
              uploaded: Value(false),
            ),
          );
}
