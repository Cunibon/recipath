import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class StorageSyncRepo extends DataSyncRepo<StorageData>
    implements PrepareUploadInterface {
  StorageSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipe;

  @override
  Future<int> prepareUpload(SyncContext context) async {
    final ingredientsSupabase = context.putIfAbsent(
      SupabaseTables.ingredient,
      () => [],
    );
    final storageSupabase = context.putIfAbsent(
      SupabaseTables.recipeStepIngredient,
      () => [],
    );

    final storageData = await repo.getNotUploaded();
    for (final storage in storageData.values) {
      storageSupabase.add(storage.toSupabase());
      ingredientsSupabase.add(storage.ingredient.toSupabase());
    }

    return storageData.length;
  }
}
