import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeSyncRepo extends DataSyncRepo {
  RecipeSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.recipe;
  @override
  $RecipeTableTable get driftTable => repo.db.recipeTable;

  @override
  RecipeTableData fromJson(Map<String, dynamic> json) =>
      RecipeTableData.fromJson(json);
}
