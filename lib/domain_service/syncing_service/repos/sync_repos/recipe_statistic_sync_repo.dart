import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeStatisticSyncRepo extends DataSyncRepo {
  RecipeStatisticSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.recipeStatistic;
  @override
  $RecipeStatisticTableTable get driftTable => repo.db.recipeStatisticTable;

  @override
  RecipeStatisticTableData fromJson(Map<String, dynamic> json) =>
      RecipeStatisticTableData.fromJson(json);
}
