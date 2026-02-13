import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class ShoppingSyncRepo extends DeletableDataDownloadRepo {
  ShoppingSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.shopping;
  @override
  $ShoppingTableTable get driftTable => repo.db.shoppingTable;

  @override
  ShoppingTableData fromJson(Map<String, dynamic> json) =>
      ShoppingTableData.fromJson(json);
}
