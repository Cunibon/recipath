import 'package:recipath/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/standard_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class RecipeShoppingAssembler
    extends StandardWriteAssembler<RecipeShoppingData> {
  RecipeShoppingAssembler({required super.repo});

  @override
  fromSupabase(Map<String, dynamic> data) =>
      RecipeShoppingData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.recipeShopping;
}
