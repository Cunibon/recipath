import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/assembly_result.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class ShoppingAssembler extends SupabaseWriteAssembler<ShoppingData> {
  ShoppingAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.shopping;

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
    final shoppingData = syncContext[tableName]!;

    for (final rawShoppingData in shoppingData) {
      try {
        final shoppingData = ShoppingData.fromSupabase(
          rawShoppingData,
          ingredientLookup[rawShoppingData["ingredient_id"]]!,
        );

        if (shoppingData.deleted) {
          await repo.delete(shoppingData);
        } else {
          await repo.add(shoppingData);
          itemAssemblyContext[shoppingData.id] = shoppingData;
        }
      } catch (e, s) {
        assemblyResult.addError(
          id: rawShoppingData["id"].toString(),
          error: e,
          stacktrace: s,
        );
      }
    }
    return assemblyResult;
  }
}
