import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeShoppingSyncRepo extends DataSyncRepo {
  RecipeShoppingSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.recipeShopping;
  @override
  $RecipeShoppingTableTable get driftTable => repo.db.recipeShoppingTable;

  @override
  RecipeShoppingTableData fromJson(Map<String, dynamic> json) =>
      RecipeShoppingTableData.fromJson(json);
}
