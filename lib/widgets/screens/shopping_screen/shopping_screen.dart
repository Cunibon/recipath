import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/shopping_screen/add_ingredient_dialog.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_screen_state_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/shopping_item.dart';

class ShoppingScreen extends ConsumerStatefulWidget {
  const ShoppingScreen({super.key});

  @override
  ConsumerState<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends ConsumerState<ShoppingScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final screenState = ref.watch(shoppingScreenStateProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            screenState.value?.shoppingData.values.any(
                  (e) => e.uploaded == false,
                ) ==
                true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => ClearConfirmationDialog(),
            );

            if (result == true) {
              ref.read(shoppingModifierProvider).clear();
            }
          },
          icon: Icon(Icons.clear_all),
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
            final currentState = await ref.read(
              shoppingScreenStateProvider.future,
            );
            ref.read(shoppingModifierProvider).addItems([
              result,
            ], currentState.groceryMap);
          }
        },
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: screenState,
        builder: (data) => SearchableList(
          searchController: searchController,
          name: localization.items,
          items: data.shoppingData.values.toList(),
          toSearchable: (item) => item.toReadable(
            grocery: data.groceryMap[item.ingredient.groceryId]!,
            unitLocalized: unitLocalized,
            doubleNumberFormat: doubleNumberFormat,
          ),
          toWidget: (item) => ShoppingItem(
            key: Key("${item.id} ${item.count}"),
            data: item,
            storageData: data.storage[item.ingredient.groceryId]?.ingredient,
          ),
          sort: (a, b) {
            if (a.done == b.done) {
              return data.groceryMap[a.ingredient.groceryId]!.name.compareTo(
                data.groceryMap[b.ingredient.groceryId]!.name,
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
