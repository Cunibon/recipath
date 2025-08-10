import 'package:recipe_list/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_keys.dart';

abstract class DeletableDownloadSyncRepo extends DataDownloadRepo
    implements DownloadInterface {
  DeletableDownloadSyncRepo({required super.supabaseClient});

  @override
  Future<DownloadResult> download(
    DateTime lastSync,
    SyncContext context,
  ) async {
    var supabaseQuery = supabaseClient
        .from(tableName)
        .select()
        .gt(SyncingKeys.updatedAtKey, lastSync.toIso8601String());

    if (lastSync == DateTime.fromMicrosecondsSinceEpoch(0)) {
      supabaseQuery = supabaseQuery.eq("deleted", false);
    }

    final supabaseData = await supabaseQuery.order(
      SyncingKeys.updatedAtKey,
      ascending: true,
    );

    context[tableName] = supabaseData;

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
