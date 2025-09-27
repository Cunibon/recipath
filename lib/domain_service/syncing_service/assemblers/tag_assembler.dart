import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class TagAssembler extends SupabaseWriteAssembler<TagData> {
  TagAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.tag;

  @override
  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final data = syncContext[tableName]!;

    for (final rawItem in data) {
      final item = TagData.fromSupabase(rawItem);

      if (item.deleted) {
        await repo.delete(item);
      } else {
        itemAssemblyContext[item.id] = item;
        await repo.add(item);
      }
    }
  }
}
