import 'package:recipath/domain_service/syncing_service/repos/assembly_result.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

abstract class SupabaseAssembler {
  SupabaseAssembler();

  String get tableName;

  List<String> get foreignDataTables => [];

  Future<AssemblyResult> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  );
}
