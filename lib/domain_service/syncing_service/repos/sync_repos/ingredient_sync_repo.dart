import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class IngredientSyncRepo extends DataSyncRepo {
  IngredientSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.ingredient;
  @override
  $IngredientTableTable get driftTable => repo.db.ingredientTable;

  @override
  IngredientTableData fromJson(Map<String, dynamic> json) =>
      IngredientTableData.fromJson(json);
}
