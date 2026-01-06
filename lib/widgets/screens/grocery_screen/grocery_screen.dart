import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_item.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class GroceryScreen extends ConsumerWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(groceryProvider);
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncData.value?.values.any((e) => e.uploaded == false) == true
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
          return data.values.isEmpty
              ? EmptyState(
                  hint: localization.createGroceryHint,
                  onTap: () =>
                      context.goRelative(GroceryRoutes.createGrocery.path),
                )
              : SearchableList(
                  name: AppLocalizations.of(context)!.grocery,
                  items: data.values.toList(),
                  toSearchable: (item) => item.toReadable(
                    unitLocalized: unitLocalized,
                    doubleNumberFormat: doubleNumberFormat,
                  ),
                  toWidget: (item) => GroceryItem(data: item),
                  sort: (a, b) => a.name.compareTo(b.name),
                );
        },
      ),
    );
  }
}
