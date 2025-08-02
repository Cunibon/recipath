import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/notifier_future_builder.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_item.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class GroceryScreen extends ConsumerWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asnyData = ref.watch(groceryNotifierProvider);

    return NavigationDrawerScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.groceriesRoute.path}/${GroceryRoutes.createGrocery.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asnyData],
        childBuilder: () {
          final data = asnyData.value!.values.toList();

          return SearchableList(
            type: "Grocery",
            items: data,
            toSearchable: (item) => item.toReadable(),
            toWidget: (item) => GroceryItem(data: item),
            sort: (a, b) => a.name.compareTo(b.name),
            bottomPadding: 78,
          );
        },
      ),
    );
  }
}
