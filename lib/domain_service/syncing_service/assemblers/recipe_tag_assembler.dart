import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class RecipeTagAssembler extends SupabaseWriteAssembler<RecipeTagData> {
  RecipeTagAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.recipeTag;

  @override
  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final data = syncContext[tableName]!;

    for (final rawItem in data) {
      final item = RecipeTagData.fromSupabase(rawItem);

      if (item.deleted) {
        await repo.delete(item);
      } else {
        await repo.add(item);
      }
    }
  }
}
