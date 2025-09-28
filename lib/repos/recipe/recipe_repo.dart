import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/repos/sync_repo.dart';

abstract class RecipeRepo extends SyncRepo<RecipeData> {
  RecipeRepo(super.db);

  Stream<Map<String, RecipeData>> streamFiltered(List<TagData> tagDataFilters);
}
