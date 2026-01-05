import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier_notifier.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_notifier.dart';

class GroceryImportScreen extends ConsumerWidget {
  const GroceryImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(importScreenProvider(filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final recipeModifier = ref.read(recipeModifierProvider);
          final groceryModifier = ref.read(groceryModifierProvider);
          final data = state.value!;

          final groceryMapping = <String, String>{};

          for (final entry in data.importGroceryLookup.entries) {
            late String id;

            if (data.originalGrocery.containsKey(entry.value.id)) {
              final copy = entry.value.copyWith(id: randomAlphaNumeric(16));
              await groceryModifier.add(copy);
              id = copy.id;
            } else {
              id = entry.value.id;
            }
            groceryMapping[entry.key] = id;
          }

          for (final data in data.importRecipe) {
            await recipeModifier.add(
              data.copyWithNewId(groceryLookup: groceryMapping),
            );
          }
          if (context.mounted) {
            context.go(RootRoutes.recipeRoute.path);
          }
        },
        child: Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CachedAsyncValueWrapper(
          asyncState: state,
          builder: (data) => GroceryImport(data: data),
        ),
      ),
    );
  }
}
