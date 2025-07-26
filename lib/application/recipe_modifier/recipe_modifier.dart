import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/repos/repo.dart';

class RecipeModifier {
  RecipeModifier(this.repo);
  final Repo<RecipeData> repo;

  Future<void> add(RecipeData newData) => repo.add(newData);

  Future<void> replace({
    required RecipeData newData,
    required RecipeData oldData,
  }) async {
    await repo.add(newData);
    await delete(oldData);
  }

  Future<void> delete(RecipeData toDelete) =>
      repo.add(toDelete.copyWith(archived: true));
}
