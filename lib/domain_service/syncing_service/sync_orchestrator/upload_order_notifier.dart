import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_pro_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_order_notifier.g.dart';

@riverpod
Future<List<String>> uploadOrderNotifier(Ref ref) async {
  final pro = await ref.watch(revenueProNotifierProvider.future);

  return [
    SupabaseTables.grocery,
    SupabaseTables.ingredient,
    SupabaseTables.shopping,

    if (pro == true) ...[
      SupabaseTables.recipe,
      SupabaseTables.recipeStep,
      SupabaseTables.recipeStepIngredient,

      SupabaseTables.storage,

      SupabaseTables.recipeStatistic,
      SupabaseTables.recipeShopping,
    ],
  ];
}
