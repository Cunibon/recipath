import 'package:recipe_list/data/recipe_statistic_data/recipe_statistic_data.dart';
import 'package:recipe_list/domain_service/syncing_service/assemblers/abstract/standard_write_assembler.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class RecipeStatisticAssembler
    extends StandardWriteAssembler<RecipeStatisticData> {
  RecipeStatisticAssembler({required super.repo});

  @override
  fromSupabase(Map<String, dynamic> data) =>
      RecipeStatisticData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.recipeStatistic;
}
