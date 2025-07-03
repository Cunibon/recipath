import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/root_routes/root_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  final goRouter = GoRouter(
    routes: [
      RootRoutes.mainRoute,
      RootRoutes.groceriesRoute,
      RootRoutes.shoppingRoute,
      RootRoutes.storageRoute,
    ],
    initialLocation: RootRoutes.mainRoute.path,
  );
  runApp(ProviderScope(child: MyApp(router: goRouter)));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Recipe List',
      theme: ThemeData.dark(),
    );
  }
}
