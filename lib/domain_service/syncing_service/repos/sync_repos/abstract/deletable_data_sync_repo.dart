import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/syncing_keys.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

abstract class DeletableDataDownloadRepo extends DataSyncRepo {
  DeletableDataDownloadRepo({
    required LocalRepo repo,
    required super.remoteStore,
  }) : super(repo: repo);

  String getDeletedId(Map<String, dynamic> data);

  @override
  Future<DownloadResult> download(DateTime lastSync) async {
    final supabaseData = await remoteStore.fetchUpdatedSince(
      supabaseTableName,
      lastSync,
      excludeDeleted: lastSync == DateTime.fromMicrosecondsSinceEpoch(0),
    );

    for (final data in supabaseData) {
      if (data[deletedKey] == true) {
        await (repo as LocalRepo).delete(getDeletedId(data));
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
