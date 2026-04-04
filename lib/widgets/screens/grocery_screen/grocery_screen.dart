import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/filter_button.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_item.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_screen_notifier.dart';

class GroceryScreen extends ConsumerWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(groceryScreenProvider);
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(localization);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncData.value?.any((e) => e.groceryData.uploaded == false) == true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goRelative(GroceryRoutes.createGrocery.path),
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: asyncData,
        builder: (data) {
          return SearchableList(
            name: localization.grocery,
            trailing: FilterButton(filterType: TagTypeEnum.grocery),
            items: data,
            toSearchable: (item) => item.groceryData.toReadable(
              unitLocalized: unitLocalized,
              doubleNumberFormat: doubleNumberFormat,
            ),
            toWidget: (item) => GroceryItem(data: item),
            sort: (a, b) => a.groceryData.name.compareTo(b.groceryData.name),
            emptyState: EmptyState(
              hint: localization.createGroceryHint,
              onTap: () => context.goRelative(GroceryRoutes.createGrocery.path),
            ),
          );
        },
      ),
    );
  }
}
