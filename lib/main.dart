import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  final isolateDb = await AppDatabase.createIsolate();
  final db = AppDatabase(await isolateDb.connect());

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  final goRouter = GoRouter(
    routes: [
      RootRoutes.recipeRoute,
      RootRoutes.groceriesRoute,
      RootRoutes.shoppingRoute,
      RootRoutes.storageRoute,
      RootRoutes.dashboardRoute,
      RootRoutes.recipeHistoryRoute,
      RootRoutes.recipeShoppingRoute,
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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({required this.router, super.key});

  final GoRouter router;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(syncingServiceNotifierProvider).start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.router,
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
