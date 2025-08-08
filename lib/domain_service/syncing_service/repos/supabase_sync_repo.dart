import 'package:recipe_list/domain_service/syncing_service/repos/download_result.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestartor.dart';
import 'package:recipe_list/repos/sync_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseSyncRepo<T> {
  SupabaseSyncRepo({required this.supabaseClient, required this.repo});

  final SupabaseClient supabaseClient;
  final SyncRepo<T> repo;
}

abstract class UploadInterface {
  Future<int> upload(SyncContext context);
}

abstract class DownloadInterface {
  Future<DownloadResult> download(DateTime lastSync, SyncContext context);
}
