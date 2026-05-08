import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/filtering/filter_button.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/clustered_searchable_list.dart';
import 'package:recipath/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/add_ingredient_dialog.dart';
import 'package:recipath/widgets/screens/shopping_screen/add_quick_shopping_item.dart';
import 'package:recipath/widgets/screens/shopping_screen/data/shopping_item_data.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/quick_shopping_not_uploaded_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_not_uploaded_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_screen_state_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/quick_shopping_item.dart';
import 'package:recipath/widgets/screens/shopping_screen/shopping_item.dart';
import 'package:recipath/widgets/tag/tag_cluster_header.dart';

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

  int getSortPriority(String type) {
    if (type == ShoppingTypeEnum.normal.name) return 1;
    if (type == ShoppingTypeEnum.quick.name) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(localization);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final screenState = ref.watch(shoppingScreenStateProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            (ref.watch(shoppingNotUploadedProvider).value ?? false) ||
                (ref.watch(quickShoppingNotUploadedProvider).value ?? false)
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
        builder: (data) => ClusteredSearchableList(
          searchController: searchController,
          name: localization.items,
          clusters: [
            for (final entry in data.clusteredData.entries)
              ItemCluster(id: entry.key, items: entry.value),
          ],
          clusterToWidget: (clusterId) {
            if (data.clusteredData.length == 1 &&
                (clusterId == ShoppingTypeEnum.normal.name ||
                    clusterId == ShoppingTypeEnum.quick.name)) {
              return SizedBox.shrink();
            }

            return TagClusterHeader(tagId: clusterId);
          },
          sortClusters: (a, b) {
            int priorityA = getSortPriority(a);
            int priorityB = getSortPriority(b);

            if (priorityA != priorityB) {
              return priorityA.compareTo(priorityB);
            }

            return data.tags[a]!.name.compareTo(data.tags[b]!.name);
          },
          itemToSearchable: (item) => switch (item) {
            ShoppingItemData() => item.toReadable(
              grocery: data.groceryMap[item.data.ingredient.groceryId]!,
              unitLocalized: unitLocalized,
              doubleNumberFormat: doubleNumberFormat,
            ),
            QuickShoppingItemData() => item.toReadable(),
          },
          itemToWidget: (item) => switch (item) {
            ShoppingItemData() => ShoppingItem(
              key: Key("${item.data.id} ${item.data.count}"),
              data: item.data,
              storageData:
                  data.storage[item.data.ingredient.groceryId]?.ingredient,
            ),
            QuickShoppingItemData() => QuickShoppingItem(data: item.data),
          },
          sortItems: (a, b) {
            if (a.done == b.done) {
              final aString = switch (a) {
                ShoppingItemData() =>
                  data.groceryMap[a.data.ingredient.groceryId]!.name,
                QuickShoppingItemData() => a.data.description,
              };
              final bString = switch (a) {
                ShoppingItemData() =>
                  data.groceryMap[a.data.ingredient.groceryId]!.name,
                QuickShoppingItemData() => a.data.description,
              };

              return aString.compareTo(bString);
            } else {
              return a.done ? 1 : -1;
            }
          },
          trailingSearch: FilterButton(
            quickFilters: [QuickFilters.cluster],
            filterType: TagTypeEnum.grocery,
          ),
          listViewPadding: edgeInsetsWithBottomPadding(context: context),
          trailingList: data.tagFiltersActive ? null : AddQuickShoppingItem(),
          emptyState: Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                EmptyState(
                  hint: localization.shoppingHint,
                  onTap: () => context.go(RootRoutes.recipeRoute.path),
                ),
                if (!data.tagFiltersActive) AddQuickShoppingItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
