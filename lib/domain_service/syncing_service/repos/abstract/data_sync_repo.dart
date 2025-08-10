import 'package:recipe_list/domain_service/syncing_service/repos/abstract/data_download_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipe_list/repos/sync_repo.dart';

abstract class DataSyncRepo<T> extends DataDownloadRepo
    implements PrepareUploadInterface {
  DataSyncRepo({required super.supabaseClient, required this.repo});
  final SyncRepo<T> repo;
}
