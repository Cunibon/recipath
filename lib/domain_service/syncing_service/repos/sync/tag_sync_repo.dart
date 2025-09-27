import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/standard_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class TagSyncRepo extends StandardDataSyncRepo<TagData> {
  TagSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.tag;

  @override
  Map<String, dynamic> toSupabase(TagData data) => data.toSupabase();
}
