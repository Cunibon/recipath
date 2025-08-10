import 'package:recipe_list/domain_service/syncing_service/assemblers/abstract/supabase_assembler.dart';
import 'package:recipe_list/repos/repo.dart';

abstract class SupabaseWriteAssembler<T> extends SupabaseAssembler {
  SupabaseWriteAssembler({required this.repo});

  final Repo<T> repo;
}
