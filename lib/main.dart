// Copyright (c) 2025 Michael Neufeld
// Licensed under the MIT License. See LICENSE file in the project root for details.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/providers/local_provider.dart';
import 'package:recipe_list/widgets/providers/theme_data_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  final isolateDb = await AppDatabase.createIsolate();
  final db = AppDatabase(await isolateDb.connect());

  final applicationPath = await getApplicationSupportDirectory();

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
      overrides: [
        databaseNotifierProvider.overrideWith((ref) => db),
        applicationPathProvider.overrideWith((ref) => applicationPath),
      ],
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
    final themeData = ref.watch(themeDataNotifierProvider);
    final locale = ref.watch(localNotifierProvider);

    return MaterialApp.router(
      title: 'ReciPath',
      locale: AppLocalizations.supportedLocales.contains(locale)
          ? locale
          : Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: widget.router,
      theme: themeData,
    );
  }
}
