import 'package:flutter/material.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/drawer_destination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_destination_notifier.g.dart';

@riverpod
List<List<DrawerDestination>> drawerDestinations(Ref ref) => [
  [
    DrawerDestination(route: RootRoutes.recipeRoute.path, icon: Icons.receipt),
    DrawerDestination(
      route: RootRoutes.shoppingRoute.path,
      icon: Icons.shopping_basket,
    ),
    DrawerDestination(
      route: RootRoutes.storageRoute.path,
      icon: Icons.category,
    ),
    DrawerDestination(
      route: RootRoutes.groceriesRoute.path,
      icon: Icons.kitchen,
    ),
  ],
  [
    DrawerDestination(
      route: RootRoutes.dashboardRoute.path,
      icon: Icons.dashboard,
    ),
    DrawerDestination(
      route: RootRoutes.recipeHistoryRoute.path,
      icon: Icons.cookie,
    ),
    DrawerDestination(
      route: RootRoutes.recipeShoppingRoute.path,
      icon: Icons.receipt_long,
    ),
  ],
  [
    DrawerDestination(
      route: RootRoutes.settingsRoute.path,
      icon: Icons.settings,
    ),
  ],
];
