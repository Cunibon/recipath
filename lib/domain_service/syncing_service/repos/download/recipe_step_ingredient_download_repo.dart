import 'package:recipe_list/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class RecipeStepIngredientDownloadRepo extends DataDownloadRepo {
  RecipeStepIngredientDownloadRepo({required super.supabaseClient});

  @override
  String get tableName => SupabaseTables.recipeStepIngredient;
}
