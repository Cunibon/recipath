import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/supabase_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestartor.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service.dart';

abstract class DeletableDownloadSyncRepo<T> extends SupabaseSyncRepo<T>
    implements DownloadInterface {
  DeletableDownloadSyncRepo({
    required super.supabaseClient,
    required super.repo,
  });

  String get tableName;

  @override
  Future<DownloadResult> download(
    DateTime lastSync,
    SyncContext context,
  ) async {
    var supabaseQuery = supabaseClient
        .from(tableName)
        .select()
        .gt(SyncingService.updatedAtKey, lastSync.toIso8601String());

    if (lastSync == DateTime.fromMicrosecondsSinceEpoch(0)) {
      supabaseQuery = supabaseQuery.eq("deleted", false);
    }

    final supabaseData = await supabaseQuery.order(
      SyncingService.updatedAtKey,
      ascending: true,
    );

    context[tableName] = supabaseData;

    final lastDateRaw = supabaseData.lastOrNull?[SyncingService.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
