import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class StorageSyncRepo extends DeletableDataDownloadRepo {
  StorageSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.storage;
  @override
  $StorageTableTable get driftTable => repo.db.storageTable;

  @override
  StorageTableData fromJson(Map<String, dynamic> json) =>
      StorageTableData.fromJson(json);
}
