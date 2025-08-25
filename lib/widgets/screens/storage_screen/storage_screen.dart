import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/storage_modifier/storage_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_sceen_state_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/storage_item.dart';

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

    final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

    final screenState = ref.watch(storageScreenStateNotifierProvider);

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
      body: CachedAsyncValueWrapper(
        asyncState: screenState,
        builder: (data) => SearchableList(
          listViewPadding: EdgeInsets.only(bottom: 12),
          searchController: searchController,
          type: localization.items,
          items: data.storageData,
          toSearchable: (item) => item.ingredient.toReadable(
            grocery: data.groceries[item.ingredient.groceryId]!,
            unitLocalized: unitLocalized,
            doubleNumberFormat: doubleNumberFormat,
          ),
          toWidget: (item) => StorageItem(data: item),
          sort: (a, b) => data.groceries[a.ingredient.groceryId]!.name
              .compareTo(data.groceries[b.ingredient.groceryId]!.name),
        ),
      ),
    );
  }
}
