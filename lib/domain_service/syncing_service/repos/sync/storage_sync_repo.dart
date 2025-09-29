import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class StorageSyncRepo extends DataSyncRepo<StorageData> {
  StorageSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.storage;

  @override
  Future<int> prepareUpload(SyncContext context) async {
    final ingredientsSupabase = context.putIfAbsent(
      SupabaseTables.ingredient,
      () => [],
    );
    final storageSupabase = context.putIfAbsent(tableName, () => []);

    final storageData = await repo.getNotUploaded();
    for (final storage in storageData.values) {
      storageSupabase.add(storage.toSupabase());
      ingredientsSupabase.add(storage.ingredient.toSupabase());
    }

    return storageData.length;
  }
}
