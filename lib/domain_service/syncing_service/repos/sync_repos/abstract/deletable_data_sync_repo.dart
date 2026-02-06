import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

abstract class DeletableDataDownloadRepo extends DataSyncRepo {
  DeletableDataDownloadRepo({
    required LocalRepo repo,
    required super.supabaseClient,
  }) : super(repo: repo);

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
      if (data[deletedKey] == true) {
        (repo as LocalRepo).delete(data[idParameter]);
      } else {
        await repo.db
            .into(driftTable)
            .insertOnConflictUpdate(fromJson(data..[uploadedKey] = true));
      }
    }

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
