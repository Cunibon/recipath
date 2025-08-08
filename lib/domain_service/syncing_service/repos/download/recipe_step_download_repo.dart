import 'package:recipe_list/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/download_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class RecipeStepDownloadRepo extends DownloadSyncRepo<RecipeStepData> {
  RecipeStepDownloadRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipeStep;
}
