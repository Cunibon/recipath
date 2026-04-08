import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/filter_button.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/clustered_searchable_list.dart';
import 'package:recipath/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_sceen_state_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/storage_item.dart';
import 'package:recipath/widgets/tag/tag_cluster_header.dart';

class StorageScreen extends ConsumerStatefulWidget {
  const StorageScreen({super.key});

  @override
  ConsumerState<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends ConsumerState<StorageScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(localization);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final screenState = ref.watch(storageScreenStateProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            screenState.value?.inStorage.values.any(
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
              ref.read(storageModifierProvider).clear();
            }
          },
          icon: Icon(Icons.clear_all),
        ),
      ],
      body: CachedAsyncValueWrapper(
        asyncState: screenState,
        builder: (data) => ClusteredSearchableList(
          listViewPadding: EdgeInsets.only(bottom: 12),
          name: localization.items,
          clusters: [
            for (final entry in data.clusteredData.entries)
              ItemCluster(id: entry.key, items: entry.value),
            ItemCluster(id: null, items: data.storageData),
          ],
          clusterToWidget: (clusterId) {
            if (data.clusteredData.isEmpty) return SizedBox.shrink();

            return TagClusterHeader(tagId: clusterId);
          },
          itemToSearchable: (item) => item.ingredient.toReadable(
            grocery: data.groceries[item.ingredient.groceryId]!,
            unitLocalized: unitLocalized,
            doubleNumberFormat: doubleNumberFormat,
          ),
          itemToWidget: (item) => StorageItem(
            key: Key("${item.ingredient.groceryId} ${item.ingredient.amount}"),
            data: item,
          ),
          sortItems: (a, b) => data.groceries[a.ingredient.groceryId]!.name
              .compareTo(data.groceries[b.ingredient.groceryId]!.name),
          sortClusters: (a, b) {
            if (a == null) {
              return 1;
            } else if (b == null) {
              return -1;
            } else {
              return data.tags[a]!.name.compareTo(data.tags[b]!.name);
            }
          },
          trailingSearch: FilterButton(
            filterType: TagTypeEnum.grocery,
            quickFilters: [QuickFilters.cluster],
          ),
          emptyState: EmptyState(hint: localization.storageHint),
        ),
      ),
    );
  }
}
