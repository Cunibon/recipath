import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/main_screen/drawer_destination.dart';
import 'package:recipe_list/widgets/main_screen/providers/drawer_destination_notifier.dart';

class NavigationDrawerScaffold extends ConsumerWidget {
  const NavigationDrawerScaffold({
    this.floatingActionButton,
    this.body,
    super.key,
  });

  final Widget? floatingActionButton;
  final Widget? body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destinations = ref.watch(drawerDestinationsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      floatingActionButton: floatingActionButton,
      drawer: NavigationDrawer(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Destinations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...destinations.map((DrawerDestination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.icon, fill: 0),
            );
          }),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
        ],
        onDestinationSelected: (value) => context.go(destinations[value].route),
      ),
      body: body,
    );
  }
}
