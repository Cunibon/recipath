import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/drawer_destination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_destination_notifier.g.dart';

@riverpod
List<List<DrawerDestination>> drawerDestinations(Ref ref) => [
  [
    DrawerDestination(
      label: "Recipes",
      route: RootRoutes.recipeRoute.path,
      icon: Icons.receipt,
    ),
    DrawerDestination(
      label: "Shopping list",
      route: RootRoutes.shoppingRoute.path,
      icon: Icons.shopping_basket,
    ),
    DrawerDestination(
      label: "Storage",
      route: RootRoutes.storageRoute.path,
      icon: Icons.category,
    ),
    DrawerDestination(
      label: "Groceries",
      route: RootRoutes.groceriesRoute.path,
      icon: Icons.kitchen,
    ),
  ],
  [
    DrawerDestination(
      label: "Dashboard",
      route: RootRoutes.dashboardRoute.path,
      icon: Icons.dashboard,
    ),
    DrawerDestination(
      label: "Cooking history",
      route: RootRoutes.recipeHistoryRoute.path,
      icon: Icons.cookie,
    ),
    DrawerDestination(
      label: "Shopping history",
      route: RootRoutes.recipeShoppingRoute.path,
      icon: Icons.receipt_long,
    ),
  ],
  [
    DrawerDestination(
      label: "Settings",
      route: RootRoutes.settingsRoute.path,
      icon: Icons.settings,
    ),
  ],
];
