import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_item.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class GroceryScreen extends ConsumerWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(groceryNotifierProvider);
    final unitLocalized = localizeUnits(context);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncData.value?.values.any((e) => e.uploaded == false) == true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.groceriesRoute.path}/${GroceryRoutes.createGrocery.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncData],
        childBuilder: () {
          final data = asyncData.value!.values.toList();

          return SearchableList(
            type: AppLocalizations.of(context)!.grocery,
            items: data,
            toSearchable: (item) => item.toReadable(unitLocalized),
            toWidget: (item) => GroceryItem(data: item),
            sort: (a, b) => a.name.compareTo(b.name),
          );
        },
      ),
    );
  }
}
