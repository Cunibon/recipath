import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/providers/storage_notifier.dart';
import 'package:recipe_list/widgets/storage_screen/storage_item.dart';

class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(storageNotifierProvider).values.toList();
    final groceries = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      actions: [
        TextButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => ClearConfirmationDialog(),
            );

            if (result == true) {
              ref.read(storageNotifierProvider.notifier).clear();
            }
          },
          child: Text("Clear"),
        ),
      ],
      body: SearchableList(
        type: "Items",
        items: items,
        toSearchable: (item) => item.toReadable(groceries[item.groceryId]!),
        toWidget: (item) => StorageItem(data: item),
        sort: (a, b) => groceries[a.groceryId]!.name.compareTo(
          groceries[b.groceryId]!.name,
        ),
      ),
    );
  }
}
