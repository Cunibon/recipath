import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeModifier {
  RecipeModifier(this.repo);
  final Repo<RecipeData> repo;

  Future<void> add(RecipeData newData) => repo.add(newData);

  Future<void> delete(RecipeData toDelete) => repo.delete(toDelete.id);
}
