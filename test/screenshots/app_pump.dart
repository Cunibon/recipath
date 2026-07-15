import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/providers/theme_data_notifier.dart';

import 'screenshot_world.dart';

const _maxSpinnerPolls = 50;
const _spinnerPollDelay = Duration(milliseconds: 50);
const _spinnerPumpDuration = Duration(milliseconds: 100);

Future<GoRouter> pumpRecipathApp(
  WidgetTester tester, {
  required ScreenshotWorld world,
  required ScreenshotDevice device,
  required String initialLocation,
}) async {
  final theme = world.container.read(themeDataProvider);

  final router = GoRouter(
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
    initialLocation: initialLocation,
  );
  addTearDown(router.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: world.container,
      child: DeviceBox.fromDevice(
        device: device,
        child: recipathMaterialApp(
          theme: theme,
          router: router,
          device: device,
        ),
      ),
    ),
  );
  await settleApp(tester);
  return router;
}

Future<void> settleApp(WidgetTester tester) async {
  await tester.pump();
  for (
    var i = 0;
    i < _maxSpinnerPolls && tester.any(find.byType(CircularProgressIndicator));
    i++
  ) {
    await tester.runAsync(() => Future<void>.delayed(_spinnerPollDelay));
    await tester.pump(_spinnerPumpDuration);
  }
  await tester.pumpAndSettle();
}

MaterialApp recipathMaterialApp({
  required ThemeData theme,
  required GoRouter router,
  ScreenshotDevice? device,
}) {
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
    theme: theme,
    locale: const Locale('en'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    builder: device == null
        ? null
        : (context, child) => device.frameBuilder(
            device: device,
            frameColors: null,
            child: child ?? const SizedBox.shrink(),
          ),
  );
}

Future<void> captureMarketingShot(
  WidgetTester tester,
  ScreenshotDevice device,
  String goldenFileName, {
  Finder? finder,
}) async {
  await tester.loadAssets();
  await _loadRobotoFonts(tester);
  await tester.pump();
  await tester.expectScreenshot(device, goldenFileName, finder: finder);
}

Future<void> _loadRobotoFonts(WidgetTester tester) async {
  await tester.runAsync(() async {
    final loader = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
    await loader.load();
  });
}
