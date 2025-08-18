import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/shopping_screen/add_ingredient_dialog.dart';
import 'package:recipe_list/widgets/screens/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipe_list/widgets/screens/shopping_screen/shopping_item.dart';
import 'package:recipe_list/widgets/screens/storage_screen/providers/storage_notifier.dart';

class ShoppingScreen extends ConsumerStatefulWidget {
  const ShoppingScreen({super.key});

  @override
  ConsumerState<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends ConsumerState<ShoppingScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final asyncItems = ref.watch(shoppingNotifierProvider);
    final asyncGroceryMap = ref.watch(groceryNotifierProvider);

    final asyncStorage = ref.watch(storageNotifierProvider);

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
              ref.read(shoppingModifierNotifierProvider).clear();
            }
          },
          child: Text(localization.clear),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<IngredientData>(
            context: context,
            builder: (context) =>
                AddIngredientDialog(initialSearch: searchController.text),
          );

          if (result != null) {
            ref.read(shoppingModifierNotifierProvider).addItems([
              result,
            ], asyncGroceryMap.value!);
          }
        },
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncItems, asyncGroceryMap, asyncStorage],
        childBuilder: () => SearchableList(
          searchController: searchController,
          type: localization.items,
          items: asyncItems.value!.values.toList(),
          toSearchable: (item) => item.toReadable(
            asyncGroceryMap.value![item.ingredient.groceryId]!,
            asyncStorage.value![item.ingredient.groceryId]?.ingredient.amount ??
                0,
            unitLocalized,
          ),
          toWidget: (item) => ShoppingItem(
            data: item,
            ingredientData:
                asyncStorage.value![item.ingredient.groceryId]?.ingredient,
          ),
          sort: (a, b) {
            if (a.done == b.done) {
              return asyncGroceryMap.value![a.ingredient.groceryId]!.name
                  .compareTo(
                    asyncGroceryMap.value![b.ingredient.groceryId]!.name,
                  );
            } else {
              return a.done ? 1 : -1;
            }
          },
        ),
      ),
    );
  }
}
