import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/standard_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class IngredientAssembler extends StandardAssembler<IngredientData> {
  IngredientAssembler();

  @override
  fromSupabase(Map<String, dynamic> data) => IngredientData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.ingredient;
}
