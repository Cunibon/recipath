import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/root_routes/root_routes.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_item.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class GroceryScreen extends ConsumerWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(groceryNotifierProvider).value!.values.toList();

    return NavigationDrawerScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.groceriesRoute.path}/${GroceryRoutes.createGrocery.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: SearchableList(
        type: "Grocery",
        items: data,
        toSearchable: (item) => item.toReadable(),
        toWidget: (item) => GroceryItem(data: item),
        sort: (a, b) => a.name.compareTo(b.name),
        bottomPadding: 78,
      ),
    );
  }
}
