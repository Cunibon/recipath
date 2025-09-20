// Copyright (c) 2025 Michael Neufeld
// Licensed under the MIT License. See LICENSE file in the project root for details.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:recipath/widgets/providers/theme_data_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  final isolateDb = await AppDatabase.createIsolate();
  final db = AppDatabase(await isolateDb.connect());

  final applicationPath = await getApplicationSupportDirectory();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  if (kDebugMode) {
    await Purchases.setLogLevel(LogLevel.debug);
  }
  await Purchases.configure(PurchasesConfiguration(revenueCatPublicKey));

  final currentUser = Supabase.instance.client.auth.currentUser;
  if (currentUser != null) {
    Purchases.logIn(currentUser.id);
  }

  final firstTime = localStorage.get<bool>(openAppFirstTime) ?? true;
  if (firstTime) {
    localStorage.setDynamic(openAppFirstTime, false);
  }

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
    initialLocation: firstTime
        ? "${RootRoutes.recipeRoute.path}/${RecipeRoutes.introductionScreen.path}"
        : RootRoutes.recipeRoute.path,
  );

  final app = ProviderScope(
    overrides: [
      databaseProvider.overrideWith((ref) => db),
      applicationPathProvider.overrideWith((ref) => applicationPath),
    ],
    child: SentryWidget(child: MyApp(router: goRouter)),
  );

  if (kDebugMode) {
    runApp(app);
  } else {
    await SentryFlutter.init((options) {
      options.dsn = sentryUrl;
    }, appRunner: () => runApp(app));
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({required this.router, super.key});

  final GoRouter router;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ref.read(syncingServiceProvider.future);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.resumed) {
      ref.read(syncingServiceProvider).value?.sync();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = ref.watch(themeDataProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: "ReciPath",
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
