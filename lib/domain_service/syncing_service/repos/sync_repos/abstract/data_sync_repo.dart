import 'package:drift/drift.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/repos/abstract/repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DataSyncRepo {
  DataSyncRepo({required this.repo, required this.supabaseClient});
  final Repo repo;

  final SupabaseClient supabaseClient;

  String get supabaseTableName;
  TableInfo get driftTable;

  Insertable fromJson(Map<String, dynamic> json);

  Future<int> upload() async {
    final toUploadData = await repo.getNotUploaded();
    final uploadJson = toUploadData
        .map((e) => e.toJson()..remove(uploadedKey))
        .toList();
    await supabaseClient.from(supabaseTableName).upsert(uploadJson);
    return toUploadData.length;
  }

  Future<DownloadResult> download(DateTime lastSync) async {
    final supabaseData = await supabaseClient
        .from(supabaseTableName)
        .select()
        .gt(SyncingKeys.updatedAtKey, lastSync.toIso8601String())
        .order(SyncingKeys.updatedAtKey, ascending: true);

    for (final data in supabaseData) {
      await repo.db
          .into(driftTable)
          .insertOnConflictUpdate(fromJson(data..[uploadedKey] = true));
    }

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
