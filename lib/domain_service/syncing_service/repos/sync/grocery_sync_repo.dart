import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/standard_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class GrocerySyncRepo extends StandardDataSyncRepo<GroceryData> {
  GrocerySyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.grocery;

  @override
  Map<String, dynamic> toSupabase(GroceryData data) => data.toSupabase();
}
