import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/full_download_result.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef AssemblyContext = Map<String, Map<String, dynamic>>;
typedef SyncContext = Map<String, List<Map<String, dynamic>>>;

class SyncOrchestrator {
  SyncOrchestrator({
    required this.uploads,
    required this.uploadOrder,
    required this.downloads,
    required this.assemblers,
    required this.supabaseClient,
  });

  final List<DataSyncRepo> uploads;
  final List<String> uploadOrder;
  final List<DataDownloadRepo> downloads;
  final List<SupabaseAssembler> assemblers;

  final SupabaseClient supabaseClient;
  bool get loggedIn => supabaseClient.auth.currentUser != null;

  final logger = Logger();

  Future<int> uploadAll() async {
    if (!loggedIn) return 0;

    final SyncContext syncContext = {};
    int uploadCount = 0;

    try {
      for (final repo in uploads) {
        final count = await repo.prepareUpload(syncContext);
        uploadCount += count;
      }

      for (final table in uploadOrder) {
        await supabaseClient.from(table).upsert(syncContext[table]!);
      }
    } catch (e, s) {
      logger.e("Error while uploading!", error: e, stackTrace: s);
      if (e is! ClientException) {
        await Sentry.captureException(
          e,
          stackTrace: s,
          withScope: (scope) => scope.setContexts('upload', {
            "syncContext": syncContext,
            "uploadOrder": uploadOrder,
            "uploads": uploads.length,
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

    final SyncContext syncContext = {};
    final AssemblyContext assemblyContext = {};

    int downloadCount = 0;

    try {
      for (final repo in downloads) {
        final currentLastSync =
            syncCopy[repo.tableName] ?? DateTime.fromMicrosecondsSinceEpoch(0);
        final result = await repo.download(currentLastSync, syncContext);

        downloadCount += result.count;
        if (result.lastDate != null) {
          syncCopy[repo.tableName] = result.lastDate!;
        }
      }

      for (final assembler in assemblers) {
        await assembler.assemble(syncContext, assemblyContext);
      }
    } catch (e, s) {
      logger.e("Error while downloading!", error: e, stackTrace: s);
      await Sentry.captureException(
        e,
        stackTrace: s,
        withScope: (scope) => scope.setContexts("download", {
          "syncContext": syncContext,
          "assemblyContext": assemblyContext,
        }),
      );
    }

    return FullDownloadResult(tableSyncs: syncCopy, count: downloadCount);
  }
}
