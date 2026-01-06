import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_screen_state.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/select_grocery_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import_item.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_notifier.dart';

class GroceryImport extends ConsumerWidget {
  const GroceryImport({required this.data, super.key});

  final ImportScreenState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 78),
      child: Column(
        children: [
          for (final entry in data.importGroceryLookup.entries)
            GroceryImportItem(
              original: data.originalGrocery[entry.key]!,
              current: entry.value,
              onTap: () async {
                final result = await showDialog<GroceryData>(
                  context: context,
                  builder: (context) => SelectGroceryDialog(),
                );

                if (result != null) {
                  ref
                      .read(importScreenProvider(data.path).notifier)
                      .selectGrocery(entry.key, result);
                }
              },
              clear: () {
                ref
                    .read(importScreenProvider(data.path).notifier)
                    .selectGrocery(entry.key, data.originalGrocery[entry.key]!);
              },
            ),
        ],
      ),
    );
  }
}
