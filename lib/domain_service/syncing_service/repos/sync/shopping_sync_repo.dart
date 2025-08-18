import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class ShoppingSyncRepo extends DataSyncRepo<ShoppingData>
    implements PrepareUploadInterface {
  ShoppingSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.shopping;

  @override
  Future<int> prepareUpload(SyncContext context) async {
    final ingredientsSupabase = context.putIfAbsent(
      SupabaseTables.ingredient,
      () => [],
    );
    final shoppingSupabase = context.putIfAbsent(tableName, () => []);

    final shoppingData = await repo.getNotUploaded();
    for (final shopping in shoppingData.values) {
      shoppingSupabase.add(shopping.toSupabase());
      ingredientsSupabase.add(shopping.ingredient.toSupabase());
    }

    return shoppingData.length;
  }
}
