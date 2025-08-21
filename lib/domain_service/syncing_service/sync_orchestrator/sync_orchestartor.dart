import 'package:logger/logger.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
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

  final List<PrepareUploadInterface> uploads;
  final List<String> uploadOrder;
  final List<DownloadInterface> downloads;
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
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap(syncContext),
      );
    }

    return uploadCount;
  }

  Future<DownloadResult> downloadAll(DateTime lastSync) async {
    if (!loggedIn) return DownloadResult(lastDate: lastSync, count: 0);

    final SyncContext syncContext = {};
    final AssemblyContext assemblyContext = {};

    int downloadCount = 0;
    DateTime latestDate = lastSync;

    try {
      for (final repo in downloads) {
        final result = await repo.download(lastSync, syncContext);

        downloadCount += result.count;
        if (result.lastDate?.isAfter(latestDate) == true) {
          latestDate = result.lastDate!;
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
        hint: Hint.withMap({
          "syncContext": syncContext,
          "assemblyContext": assemblyContext,
        }),
      );
    }

    return DownloadResult(lastDate: latestDate, count: downloadCount);
  }
}
