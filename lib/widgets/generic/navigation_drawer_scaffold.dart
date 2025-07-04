import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/main_screen/drawer_destination.dart';
import 'package:recipe_list/widgets/main_screen/providers/drawer_destination_notifier.dart';

class NavigationDrawerScaffold extends ConsumerWidget {
  const NavigationDrawerScaffold({
    this.floatingActionButton,
    this.body,
    this.actions,
    super.key,
  });

  final Widget? floatingActionButton;
  final Widget? body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final destinations = ref.watch(drawerDestinationsProvider);

    final selectedIndex = destinations.indexWhere(
      (element) => currentRoute.startsWith(element.route),
    );

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
        title: Text(
          destinations[selectedIndex].label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: actions,
      ),
      floatingActionButton: floatingActionButton,
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
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
            );
          }),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
        ],
        onDestinationSelected: (index) => context.go(destinations[index].route),
      ),
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: body,
        ),
      ),
    );
  }
}
