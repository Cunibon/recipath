import 'package:recipe_list/domain_service/syncing_service/sync_orchestartor.dart';
import 'package:recipe_list/repos/repo.dart';

abstract class SupabaseAssembler<T> {
  SupabaseAssembler({required this.repo});

  final Repo<T> repo;

  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  );
}
