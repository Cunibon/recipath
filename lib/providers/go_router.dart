import 'package:go_router/go_router.dart';
import 'package:recipath/common.dart';
import 'package:recipath/root_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) => GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    RootRoutes.recipeRoute,
    RootRoutes.groceriesRoute,
    RootRoutes.shoppingRoute,
    RootRoutes.storageRoute,
    RootRoutes.tagRoute,
    RootRoutes.dashboardRoute,
    RootRoutes.recipeHistoryRoute,
    RootRoutes.recipeShoppingRoute,
    RootRoutes.settingsRoute,
    RootRoutes.importRoute,
    RootRoutes.resetPasswordRoute,
  ],
  initialLocation: RootRoutes.recipeRoute.path,
);
