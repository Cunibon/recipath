import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/select_grocery_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import_item.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';

class GroceryImport extends ConsumerWidget {
  const GroceryImport({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeImportData = ref
        .watch(recipeImportScreenProvider(filePath))
        .value!;
    final groceryImportData = ref
        .watch(groceryImportScreenProvider(filePath))
        .value!;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 78),
      child: Column(
        children: [
          for (final entry in groceryImportData.entries)
            GroceryImportItem(
              original: recipeImportData.originalGrocery[entry.key]!,
              current: entry.value,
              onTap: () async {
                final result = await showDialog<GroceryData>(
                  context: context,
                  builder: (context) => SelectGroceryDialog(),
                );

                if (result != null) {
                  ref
                      .read(groceryImportScreenProvider(filePath).notifier)
                      .selectGrocery(entry.key, result);
                }
              },
              clear: () {
                ref
                    .read(groceryImportScreenProvider(filePath).notifier)
                    .selectGrocery(
                      entry.key,
                      recipeImportData.originalGrocery[entry.key]!,
                    );
              },
            ),
        ],
      ),
    );
  }
}
