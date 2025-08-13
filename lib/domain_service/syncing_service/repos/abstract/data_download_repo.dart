import 'package:recipe_list/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DataDownloadRepo implements DownloadInterface {
  DataDownloadRepo({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  String get tableName;

  @override
  Future<DownloadResult> download(
    DateTime lastSync,
    SyncContext context,
  ) async {
    final supabaseData = await supabaseClient
        .from(tableName)
        .select()
        .gt(SyncingKeys.updatedAtKey, lastSync.toIso8601String())
        .order(SyncingKeys.updatedAtKey, ascending: true);
    context[tableName] = supabaseData;

    final lastDateRaw = supabaseData.lastOrNull?[SyncingKeys.updatedAtKey];
    return DownloadResult(
      lastDate: lastDateRaw == null ? null : DateTime.parse(lastDateRaw),
      count: supabaseData.length,
    );
  }
}
