import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/providers/drawer_destination_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/drawer_destination.dart';

class NavigationDrawerScaffold extends ConsumerWidget {
  const NavigationDrawerScaffold({
    this.floatingActionButton,
    this.body,
    this.actions,
    this.titleBuilder,
    super.key,
  });

  final Widget? floatingActionButton;
  final Widget? body;
  final List<Widget>? actions;
  final Widget Function(String title)? titleBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final nestedDestinations = ref.watch(drawerDestinationsProvider);
    final destiantions = nestedDestinations.expand((e) => e).toList();

    final selectedIndex = destiantions.indexWhere(
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
        title: titleBuilder == null
            ? Text(
                destiantions[selectedIndex].label,
                style: Theme.of(context).textTheme.titleLarge,
              )
            : titleBuilder!(destiantions[selectedIndex].label),
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
          for (final destinations in nestedDestinations) ...[
            ...destinations.map((DrawerDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: Icon(destination.icon),
              );
            }),
            Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          ],
        ],
        onDestinationSelected: (index) => context.go(destiantions[index].route),
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
