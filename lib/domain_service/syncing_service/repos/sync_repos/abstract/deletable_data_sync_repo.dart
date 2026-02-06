import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';

abstract class DeletableDataDownloadRepo extends DataSyncRepo {
  DeletableDataDownloadRepo({
    required super.repo,
    required super.supabaseClient,
  });

  @override
  Future<DownloadResult> download(DateTime lastSync) async {
    var supabaseQuery = supabaseClient
        .from(supabaseTableName)
        .select()
        .gt(SyncingKeys.updatedAtKey, lastSync.toIso8601String());

    if (lastSync == DateTime.fromMicrosecondsSinceEpoch(0)) {
      supabaseQuery = supabaseQuery.eq(SyncingKeys.deleted, false);
    }

    final supabaseData = await supabaseQuery.order(
      SyncingKeys.updatedAtKey,
      ascending: true,
    );

    for (final data in supabaseData) {
      await repo.db.into(driftTable).insertOnConflictUpdate(fromJson(data));
    }

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
