import 'package:recipe_list/domain_service/syncing_service/repos/download_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/supabase_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestartor.dart';

abstract class StandardDataSyncRepo<T> extends DownloadSyncRepo<T>
    implements DownloadInterface, UploadInterface {
  StandardDataSyncRepo({required super.supabaseClient, required super.repo});

  Map<String, dynamic> toSupabase(T data);

  @override
  Future<int> upload(SyncContext context) async {
    final repoData = await repo.getNotUploaded();
    final uploadData = repoData.values.map(toSupabase).toList();
    if (uploadData.isNotEmpty) {
      await supabaseClient.from(tableName).upsert(uploadData);
    }

    context[tableName] = uploadData;

    return repoData.length;
  }
}
