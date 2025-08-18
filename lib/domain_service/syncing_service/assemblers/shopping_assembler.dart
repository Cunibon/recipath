import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class ShoppingAssembler extends SupabaseWriteAssembler<ShoppingData> {
  ShoppingAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.shopping;

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
    final shoppingData = syncContext[tableName]!;

    for (final rawShoppingData in shoppingData) {
      final shoppingData = ShoppingData.fromSupabase(
        rawShoppingData,
        ingredientLookup[rawShoppingData["ingredient_id"]]!,
      );

      if (shoppingData.deleted) {
        await repo.delete(shoppingData.id);
      } else {
        itemAssemblyContext[shoppingData.id] = shoppingData;
        await repo.add(shoppingData);
      }
    }
  }
}
