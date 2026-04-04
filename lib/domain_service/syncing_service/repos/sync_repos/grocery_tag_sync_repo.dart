import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class GroceryTagSyncRepo extends DeletableDataDownloadRepo {
  GroceryTagSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.groceryTag;
  @override
  $GroceryTagTableTable get driftTable => repo.db.groceryTagTable;

  @override
  GroceryTagTableData fromJson(Map<String, dynamic> json) =>
      GroceryTagTableData.fromJson(json);
}
