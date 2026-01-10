import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/assembly_result.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class StorageAssembler extends SupabaseWriteAssembler<StorageData> {
  StorageAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.storage;

  @override
  List<String> get foreignDataTables => [SupabaseTables.ingredient];

  @override
  Future<AssemblyResult> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final assemblyResult = AssemblyResult();

    final ingredientLookup = assemblyContext[SupabaseTables.ingredient]!;

    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final storageData = syncContext[tableName]!;

    for (final rawStorageData in storageData) {
      try {
        final storageData = StorageData.fromSupabase(
          rawStorageData,
          ingredientLookup[rawStorageData["ingredient_id"]]!,
        );

        if (storageData.deleted) {
          await repo.delete(storageData);
        } else {
          await repo.add(storageData);
          itemAssemblyContext[storageData.id] = storageData;
        }
      } catch (e, s) {
        assemblyResult.addError(
          id: rawStorageData["id"].toString(),
          error: e,
          stacktrace: s,
        );
      }
    }

    return assemblyResult;
  }
}
