import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/authentication/auth_buttons.dart';
import 'package:recipath/widgets/generic/dialogs/close_app_dialog.dart';
import 'package:recipath/widgets/providers/drawer_destination_notifier.dart';

class NavigationDrawerScaffold extends ConsumerWidget {
  const NavigationDrawerScaffold({
    this.floatingActionButton,
    this.body,
    this.actions,
    required this.titleBuilder,
    super.key,
  });

  final Widget? floatingActionButton;
  final Widget? body;
  final List<Widget>? actions;
  final Widget Function(String title) titleBuilder;

  Map<String, String> localizeRoutes(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return {
      RootRoutes.recipeRoute.path: localization.recipes,
      RootRoutes.shoppingRoute.path: localization.shoppingList,
      RootRoutes.storageRoute.path: localization.storage,
      RootRoutes.groceriesRoute.path: localization.groceries,
      RootRoutes.tagRoute.path: localization.tags,
      RootRoutes.dashboardRoute.path: localization.dashboard,
      RootRoutes.recipeHistoryRoute.path: localization.cookingHistory,
      RootRoutes.recipeShoppingRoute.path: localization.shoppingHistory,
      RootRoutes.settingsRoute.path: localization.settings,
      RootRoutes.importRoute.path: localization.importData,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final localizedRoutes = localizeRoutes(context);

    final nestedDestinations = ref.watch(drawerDestinationsProvider);
    final destiantions = nestedDestinations.expand((e) => e).toList();

    final selectedIndex = destiantions.indexWhere(
      (element) => currentRoute.startsWith(element.route),
    );
    final localization = AppLocalizations.of(context)!;

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
        title: titleBuilder(
          localizedRoutes[destiantions[selectedIndex].route]!,
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
              localization.destinations,
              style: TextTheme.of(context).titleLarge,
            ),
          ),
          for (final destinations in nestedDestinations) ...[
            ...destinations.map((destination) {
              return NavigationDrawerDestination(
                label: Text(localizedRoutes[destination.route]!),
                icon: Icon(destination.icon),
              );
            }),
            Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          ],
          AuthButtons(),
        ],
        onDestinationSelected: (index) => context.go(destiantions[index].route),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          final state = GoRouterState.of(context);
          final basePath = state.uri.path;

          if (basePath == RootRoutes.recipeRoute.path) {
            if (Platform.isAndroid) {
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => CloseAppDialog(),
              );

              if (result == true) {
                SystemNavigator.pop();
              }
            }
          } else {
            context.go(RootRoutes.recipeRoute.path);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: body,
        ),
      ),
    );
  }
}
