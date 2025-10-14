import 'package:recipath/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/repos/sync_repo.dart';

abstract class DataSyncRepo<T> extends DataDownloadRepo {
  DataSyncRepo({required super.supabaseClient, required this.repo});
  final SyncRepo<T> repo;

  Future<int> prepareUpload(SyncContext context);
}
