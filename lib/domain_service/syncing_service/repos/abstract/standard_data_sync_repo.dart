import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class StandardDataSyncRepo<T> extends DataSyncRepo<T>
    implements DownloadInterface, PrepareUploadInterface {
  StandardDataSyncRepo({required super.supabaseClient, required super.repo});

  Map<String, dynamic> toSupabase(T data);

  @override
  Future<int> prepareUpload(SyncContext context) async {
    final repoData = await repo.getNotUploaded();
    final uploadData = repoData.values.map(toSupabase).toList();
    if (uploadData.isNotEmpty) {
      await supabaseClient.from(tableName).upsert(uploadData);
    }

    context[tableName] = uploadData;

    return repoData.length;
  }
}
