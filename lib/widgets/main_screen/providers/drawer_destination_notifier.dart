import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/root_routes/root_routes.dart';
import 'package:recipe_list/widgets/main_screen/drawer_destination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_destination_notifier.g.dart';

@Riverpod(dependencies: [])
List<DrawerDestination> drawerDestinations(Ref ref) => [
  DrawerDestination(
    label: "Recipes",
    route: RootRoutes.mainRoute.path,
    icon: Icons.receipt,
  ),
  DrawerDestination(
    label: "Groceries",
    route: RootRoutes.groceriesRoute.path,
    icon: Icons.kitchen,
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
    label: "Settings",
    route: RootRoutes.settingsRoute.path,
    icon: Icons.settings,
    secondary: true,
  ),
];
