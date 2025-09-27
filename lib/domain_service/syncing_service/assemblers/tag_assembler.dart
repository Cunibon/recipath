import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/standard_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class TagAssembler extends StandardWriteAssembler<TagData> {
  TagAssembler({required super.repo});

  @override
  fromSupabase(Map<String, dynamic> data) => TagData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.tag;
}
