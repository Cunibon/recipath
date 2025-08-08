import 'package:recipe_list/domain_service/syncing_service/repos/download_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class IngredientDownloadRepo extends DownloadSyncRepo {
  IngredientDownloadRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipeStep;
}
