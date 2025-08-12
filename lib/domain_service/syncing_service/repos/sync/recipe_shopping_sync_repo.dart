import 'package:recipe_list/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/standard_data_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class RecipeShoppingSyncRepo extends StandardDataSyncRepo<RecipeShoppingData> {
  RecipeShoppingSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipeShopping;

  @override
  Map<String, dynamic> toSupabase(RecipeShoppingData data) => data.toSupabase();
}
