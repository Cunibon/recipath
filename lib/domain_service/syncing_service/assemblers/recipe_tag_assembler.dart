import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/standard_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class RecipeTagAssembler extends StandardWriteAssembler<RecipeTagData> {
  RecipeTagAssembler({required super.repo});

  @override
  fromSupabase(Map<String, dynamic> data) => RecipeTagData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.recipeTag;
}
