import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeTagSyncRepo extends DeletableDataDownloadRepo {
  RecipeTagSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.recipeTag;
  @override
  $RecipeTagTableTable get driftTable => repo.db.recipeTagTable;

  @override
  RecipeTagTableData fromJson(Map<String, dynamic> json) =>
      RecipeTagTableData.fromJson(json);
}
