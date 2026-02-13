import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/deletable_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class TagSyncRepo extends DeletableDataDownloadRepo {
  TagSyncRepo({required super.repo, required super.supabaseClient});

  @override
  String get supabaseTableName => SupabaseTables.tag;
  @override
  $TagTableTable get driftTable => repo.db.tagTable;

  @override
  TagTableData fromJson(Map<String, dynamic> json) =>
      TagTableData.fromJson(json);
}
