import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class GrocerySyncRepo extends DataSyncRepo {
  GrocerySyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.grocery;
  @override
  $GroceryTableTable get driftTable => repo.db.groceryTable;

  @override
  GroceryTableData fromJson(Map<String, dynamic> json) =>
      GroceryTableData.fromJson(json);
}
