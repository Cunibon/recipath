import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/supabase_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_assembler.dart';

typedef AssemblyContext = Map<String, Map<String, dynamic>>;
typedef SyncContext = Map<String, List<Map<String, dynamic>>>;

class SyncOrchestrator {
  final List<DownloadInterface> downloadOrder;
  final List<UploadInterface> uploadOrder;
  final List<SupabaseAssembler> assemblers;

  SyncOrchestrator({
    required this.downloadOrder,
    required this.uploadOrder,
    required this.assemblers,
  });

  Future<DownloadResult> downloadAll(DateTime lastSync) async {
    final SyncContext syncContext = {};
    int downloadCount = 0;
    DateTime latestDate = lastSync;

    for (final repo in downloadOrder) {
      final result = await repo.download(lastSync, syncContext);

      downloadCount += result.count;
      if (result.lastDate?.isAfter(latestDate) == true) {
        latestDate = result.lastDate!;
      }
    }

    final AssemblyContext assemblyContext = {};

    for (final assembler in assemblers) {
      await assembler.assemble(syncContext, assemblyContext);
    }

    return DownloadResult(lastDate: latestDate, count: downloadCount);
  }

  Future<int> uploadAll() async {
    final SyncContext syncContext = {};
    int uploadCount = 0;

    for (final repo in uploadOrder) {
      final count = await repo.upload(syncContext);
      uploadCount += count;
    }

    return uploadCount;
  }
}
