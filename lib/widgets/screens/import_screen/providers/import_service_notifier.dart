import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/application/recipe_tag_modifier/recipe_tag_modifier_notifier.dart';
import 'package:recipath/application/tag_modifier/tag_modifier_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/import_service.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
Future<ImportService> importServiceNotifier(Ref ref, String path) async =>
    ImportService(
      importData: await ref.watch(importDataProvider(path).future),
      recipeImportState: await ref.watch(
        recipeImportScreenProvider(path).future,
      ),
      groceries: await ref.watch(groceryImportScreenProvider(path).future),
      recipeModifier: ref.watch(recipeModifierProvider),
      groceryModifier: ref.watch(groceryModifierProvider),
      tagModifier: ref.watch(tagModifierProvider),
      recipeTagModifier: ref.watch(recipeTagModifierProvider),
    );
