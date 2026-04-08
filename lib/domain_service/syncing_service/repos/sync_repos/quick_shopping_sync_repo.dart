import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class QuickShoppingSyncRepo extends DeletableDataDownloadRepo {
  QuickShoppingSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.quickShopping;
  @override
  $QuickShoppingTableTable get driftTable => repo.db.quickShoppingTable;

  @override
  String getDeletedId(Map<String, dynamic> data) => data[idParameter];

  @override
  QuickShoppingTableData fromJson(Map<String, dynamic> json) =>
      QuickShoppingTableData.fromJson(json);
}
