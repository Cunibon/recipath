import 'package:recipath/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipath/repos/sync_repo.dart';

abstract class DataSyncRepo<T> extends DataDownloadRepo
    implements PrepareUploadInterface {
  DataSyncRepo({required super.supabaseClient, required this.repo});
  final SyncRepo<T> repo;
}
