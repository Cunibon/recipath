import 'dart:async';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/repos/full_download_result.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncOrchestrator {
  SyncOrchestrator({required this.syncRepos, required this.supabaseClient});

  final List<DataSyncRepo> syncRepos;

  final SupabaseClient supabaseClient;
  bool get loggedIn => supabaseClient.auth.currentUser != null;

  final logger = Logger();

  Future<int> uploadAll() async {
    if (!loggedIn) return 0;

    int uploadCount = 0;

    try {
      for (final repo in syncRepos) {
        final count = await repo.upload();
        uploadCount += count;
      }
    } catch (e, s) {
      logger.e("Error while uploading!", error: e, stackTrace: s);
      if (e is! ClientException) {
        await Sentry.captureException(
          e,
          stackTrace: s,
          withScope: (scope) =>
              scope.setContexts('upload', {"uploads": syncRepos.length}),
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
      for (final repo in syncRepos) {
        final currentLastSync =
            syncCopy[repo.supabaseTableName] ??
            DateTime.fromMicrosecondsSinceEpoch(0);
        final result = await repo.download(currentLastSync);

        downloadCount += result.count;
        if (result.lastDate != null) {
          syncCopy[repo.supabaseTableName] = result.lastDate!;
        }
      }
    } catch (e, s) {
      logger.e("Error while downloading!", error: e, stackTrace: s);
      await Sentry.captureException(e, stackTrace: s);
    }

    return FullDownloadResult(tableSyncs: syncCopy, count: downloadCount);
  }
}
