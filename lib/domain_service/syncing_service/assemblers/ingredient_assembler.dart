import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/domain_service/syncing_service/assemblers/abstract/standard_assembler.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';

class IngredientAssembler extends StandardAssembler<IngredientData> {
  IngredientAssembler();

  @override
  fromSupabase(Map<String, dynamic> data) => IngredientData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.ingredient;
}
