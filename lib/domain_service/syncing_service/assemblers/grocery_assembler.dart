import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/standard_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';

class GroceryAssembler extends StandardWriteAssembler<GroceryData> {
  GroceryAssembler({required super.repo});

  @override
  fromSupabase(Map<String, dynamic> data) => GroceryData.fromSupabase(data);

  @override
  String get tableName => SupabaseTables.grocery;
}
