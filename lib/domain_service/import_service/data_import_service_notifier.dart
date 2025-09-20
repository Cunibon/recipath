import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/domain_service/import_service/data_import_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_import_service_notifier.g.dart';

@riverpod
DataImportService dataImportServiceNotifier(Ref ref) {
  final recipeModifier = ref.watch(recipeModifierProvider);
  final shoppingModifier = ref.watch(shoppingModifierProvider);
  final storageModifier = ref.watch(storageModifierProvider);
  final groceryModifier = ref.watch(groceryModifierProvider);
  return DataImportService(
    recipeModifier: recipeModifier,
    shoppingModifier: shoppingModifier,
    storageModifier: storageModifier,
    groceryModifier: groceryModifier,
  );
}
