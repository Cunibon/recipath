import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_assembler.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class StandardAssembler<T> extends SupabaseAssembler {
  StandardAssembler();

  T fromSupabase(Map<String, dynamic> data);

  @override
  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final items = syncContext[tableName]!;

    for (final item in items) {
      final assembled = fromSupabase(item);
      itemAssemblyContext[item["id"]] = assembled;
    }
  }
}
