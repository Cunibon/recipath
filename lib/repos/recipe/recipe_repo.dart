import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

abstract class RecipeRepo extends LocalRepo<RecipeData> {
  RecipeRepo(super.db);

  Stream<Map<String, RecipeData>> streamFiltered(Set<String> tagDataFilters);
}
