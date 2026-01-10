import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/assembly_result.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class StandardWriteAssembler<T> extends SupabaseWriteAssembler<T> {
  StandardWriteAssembler({required super.repo});

  T fromSupabase(Map<String, dynamic> data);

  @override
  Future<AssemblyResult> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final assemblyResult = AssemblyResult();

    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final items = syncContext[tableName]!;

    for (final item in items) {
      try {
        final assembled = fromSupabase(item);
        await repo.add(assembled);
        itemAssemblyContext[item["id"]] = assembled;
      } catch (e, s) {
        assemblyResult.addError(
          id: item["id"].toString(),
          error: e,
          stacktrace: s,
        );
      }
    }

    return assemblyResult;
  }
}
