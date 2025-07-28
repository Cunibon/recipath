import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/root_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  final isolateDb = await AppDatabase.createIsolate();
  final db = AppDatabase(await isolateDb.connect());

  final goRouter = GoRouter(
    routes: [
      RootRoutes.recipeRoute,
      RootRoutes.groceriesRoute,
      RootRoutes.shoppingRoute,
      RootRoutes.storageRoute,
      RootRoutes.dashboardRoute,
      RootRoutes.recipeHistoryRoute,
      RootRoutes.settingsRoute,
    ],
    initialLocation: RootRoutes.recipeRoute.path,
  );

  runApp(
    ProviderScope(
      overrides: [databaseNotifierProvider.overrideWith((ref) => db)],
      child: MyApp(router: goRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Recipe List',
      theme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[900],
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
