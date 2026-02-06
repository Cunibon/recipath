import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/drift/database.dart';

class RecipeStepIngredientSyncRepo extends DataSyncRepo {
  RecipeStepIngredientSyncRepo({
    required super.repo,
    required super.supabaseClient,
  });

  @override
  String get supabaseTableName => SupabaseTables.recipeStepIngredient;
  @override
  $RecipeStepIngredientTableTable get driftTable =>
      repo.db.recipeStepIngredientTable;

  @override
  RecipeStepIngredientTableData fromJson(Map<String, dynamic> json) =>
      RecipeStepIngredientTableData.fromJson(json);
}
