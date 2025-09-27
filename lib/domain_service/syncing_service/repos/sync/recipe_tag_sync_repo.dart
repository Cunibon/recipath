import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/standard_data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class RecipeTagSyncRepo extends StandardDataSyncRepo<RecipeTagData> {
  RecipeTagSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipeTag;

  @override
  Map<String, dynamic> toSupabase(RecipeTagData data) => data.toSupabase();
}
