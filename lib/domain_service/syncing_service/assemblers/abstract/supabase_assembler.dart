import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class SupabaseAssembler {
  SupabaseAssembler();

  String get tableName;

  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  );
}
