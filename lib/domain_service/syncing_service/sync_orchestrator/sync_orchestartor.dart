import 'dart:async';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/repos/full_download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncOrchestrator {
  SyncOrchestrator({
    required this.syncRepoBatches,
    required this.supabaseClient,
  });

  final List<List<DataSyncRepo>> syncRepoBatches;

  final SupabaseClient supabaseClient;
  bool get loggedIn => supabaseClient.auth.currentUser != null;

  final logger = Logger();

  Future<int> uploadAll() async {
    if (!loggedIn) return 0;

    int uploadCount = 0;

    try {
      for (final batch in syncRepoBatches) {
        final results = await Future.wait(batch.map((repo) => repo.upload()));
        uploadCount += results.reduce((value, element) => value + element);
      }
    } catch (e, s) {
      logger.e("Error while uploading!", error: e, stackTrace: s);
      if (e is! ClientException) {
        await Sentry.captureException(
          e,
          stackTrace: s,
          withScope: (scope) => scope.setContexts('upload', {
            "uploads": syncRepoBatches.expand((e) => e).length,
          }),
        );
      }
    }

    return uploadCount;
  }

  Future<FullDownloadResult> downloadAll(
    Map<String, DateTime> tableSyncs,
  ) async {
    final syncCopy = Map<String, DateTime>.from(tableSyncs);
    if (!loggedIn) return FullDownloadResult(tableSyncs: syncCopy, count: 0);

    int downloadCount = 0;

    try {
      for (final batch in syncRepoBatches) {
        final results = await Future.wait(
          batch.map((repo) async {
            final currentLastSync =
                syncCopy[repo.supabaseTableName] ??
                DateTime.fromMicrosecondsSinceEpoch(0);
            return await repo.download(currentLastSync);
          }),
        );

        for (int i = 0; i < batch.length; i++) {
          final repo = batch[i];
          final result = results[i];

          downloadCount += result.count;
          if (result.lastDate != null) {
            syncCopy[repo.supabaseTableName] = result.lastDate!;
          }
        }
      }
    } catch (e, s) {
      logger.e("Error while downloading!", error: e, stackTrace: s);
      await Sentry.captureException(e, stackTrace: s);
    }

    return FullDownloadResult(tableSyncs: syncCopy, count: downloadCount);
  }
}
