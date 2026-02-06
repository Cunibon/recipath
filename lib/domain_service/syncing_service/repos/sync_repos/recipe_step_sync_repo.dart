import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeStepSyncRepo extends DataSyncRepo {
  RecipeStepSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.recipeStep;
  @override
  $RecipeStepTableTable get driftTable => repo.db.recipeStepTable;

  @override
  RecipeStepTableData fromJson(Map<String, dynamic> json) =>
      RecipeStepTableData.fromJson(json);
}
