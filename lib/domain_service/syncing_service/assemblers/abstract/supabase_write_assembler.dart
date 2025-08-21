import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_assembler.dart';
import 'package:recipath/repos/repo.dart';

abstract class SupabaseWriteAssembler<T> extends SupabaseAssembler {
  SupabaseWriteAssembler({required this.repo});

  final Repo<T> repo;
}
