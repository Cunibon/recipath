import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class StorageAssembler extends SupabaseWriteAssembler<StorageData> {
  StorageAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.storage;

  @override
  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final ingredientLookup = assemblyContext[SupabaseTables.ingredient]!;

    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final storageData = syncContext[tableName]!;

    for (final rawStorageData in storageData) {
      final storageData = StorageData.fromSupabase(
        rawStorageData,
        ingredientLookup[rawStorageData["ingredient_id"]]!,
      );

      if (storageData.deleted) {
        await repo.delete(storageData.id);
      } else {
        itemAssemblyContext[storageData.id] = storageData;
        await repo.add(storageData);
      }
    }
  }
}
