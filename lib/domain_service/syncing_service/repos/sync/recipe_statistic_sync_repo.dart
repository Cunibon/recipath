import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/domain_service/syncing_service/repos/abstract/standard_data_sync_repo.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class RecipeStatisticSyncRepo
    extends StandardDataSyncRepo<RecipeStatisticData> {
  RecipeStatisticSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipeStatistic;

  @override
  Map<String, dynamic> toSupabase(RecipeStatisticData data) =>
      data.toSupabase();
}
