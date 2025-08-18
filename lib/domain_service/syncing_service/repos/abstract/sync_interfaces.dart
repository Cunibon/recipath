import 'package:recipath/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class PrepareUploadInterface {
  Future<int> prepareUpload(SyncContext context);
}

abstract class DownloadInterface {
  Future<DownloadResult> download(DateTime lastSync, SyncContext context);
}
