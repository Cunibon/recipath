import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/shopping_screen/add_ingredient_dialog.dart';
import 'package:recipe_list/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipe_list/widgets/screens/storage_screen/storage_item.dart';

class StorageScreen extends ConsumerStatefulWidget {
  const StorageScreen({super.key});

  @override
  ConsumerState<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends ConsumerState<StorageScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final asyncItems = ref.watch(storageNotifierProvider);
    final asyncGroceries = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncItems.value?.values.any((e) => e.uploaded == false) == true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => ClearConfirmationDialog(),
            );

            if (result == true) {
              ref.read(storageModifierNotifierProvider).clear();
            }
          },
          child: Text(localization.clear),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ingredient = (await showDialog<IngredientData>(
            context: context,
            builder: (context) => AddIngredientDialog(
              initialSearch: searchController.text,
              selected: asyncItems.value!.values.toList().map(
                (e) => e.ingredient.groceryId,
              ),
              allowSelectedRemoval: false,
            ),
          ));

          if (ingredient != null) {
            ref.read(storageModifierNotifierProvider).addItem(ingredient);
          }
        },
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncItems, asyncGroceries],
        childBuilder: () => SearchableList(
          searchController: searchController,
          type: localization.items,
          items: asyncItems.value!.values.toList(),
          toSearchable: (item) => item.ingredient.toReadable(
            asyncGroceries.value![item.ingredient.groceryId]!,
            unitLocalized,
          ),
          toWidget: (item) => StorageItem(data: item),
          sort: (a, b) => asyncGroceries.value![a.ingredient.groceryId]!.name
              .compareTo(asyncGroceries.value![b.ingredient.groceryId]!.name),
        ),
      ),
    );
  }
}
