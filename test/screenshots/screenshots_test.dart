import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:recipath/widgets/providers/theme_data_notifier.dart';
import 'package:recipath/widgets/screens/dashboard_screen/dashboard_screen.dart';

import 'app_pump.dart';
import 'marketing_frame.dart';
import 'screenshot_world.dart';

void main() {
  ScreenshotDevice.screenshotsFolder = r'../../metadata/$langCode/images/';

  for (final target in MarketingTarget.values) {
    group(target.name, () {
      testGoldens('recipes', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'See what you\ncan cook at a\nglance',
          initialLocation: '/recipes',
          goldenFileName: 'recipes',
        );
      });

      testGoldens('create recipe', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'Create recipes\nstep by step',
          initialLocation: '/recipes',
          goldenFileName: 'create_recipes',
          navigate: (router, world) async {
            final teriyaki = world.recipeByTitle('Chicken teriyaki');
            router.go('/recipes/createRecipe?id=${teriyaki.id}');
          },
        );
      });

      testGoldens('grocery info', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'Add groceries\nwith nutrient\ninfos',
          initialLocation: '/groceries',
          goldenFileName: 'grocery_info',
          navigate: (router, world) async {
            final sugar = world.groceryByName('Sugar');
            router.go('/groceries/createGrocery?id=${sugar.id}');
          },
        );
      });

      testGoldens('shopping list', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'See exactly\nwhat you need\nto buy',
          initialLocation: '/shopping',
          goldenFileName: 'shopping_list',
        );
      });

      testGoldens('shopping mode', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'Plan your\nshopping list\non your recipes',
          initialLocation: '/recipes',
          goldenFileName: 'shopping_mode',
          navigate: (router, world) async {
            await tester.tap(find.byIcon(Icons.shopping_cart));
            await tester.pumpAndSettle();

            await tester.tap(find.textContaining('Bolognese').first);
            await tester.pump();
            await tester.tap(find.textContaining('Chicken teriyaki').first);
          },
        );
      });

      testGoldens('tags', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'Tag groceries\nand recipes',
          initialLocation: '/tag',
          goldenFileName: 'tags',
        );
      });

      testGoldens('storage', (tester) async {
        await captureScreen(
          tester,
          target: target,
          title: 'See what you\nbought added\nto storage',
          initialLocation: '/storage',
          goldenFileName: 'storage',
          fullyStocked: true,
        );
      });

      testGoldens('dashboard', (tester) async {
        const title = 'Track your\nconsumption';
        if (target == MarketingTarget.ipad) {
          await captureScreen(
            tester,
            target: target,
            title: title,
            initialLocation: '/dashboard',
            goldenFileName: 'dashboard',
          );
        } else {
          await captureDualPhoneDashboard(tester, target, title);
        }
      });
    });
  }
}

Future<void> captureScreen(
  WidgetTester tester, {
  required MarketingTarget target,
  required String title,
  required String initialLocation,
  required String goldenFileName,
  bool fullyStocked = false,
  Future<void> Function(GoRouter router, ScreenshotWorld world)? navigate,
}) async {
  final world = await setUpScreenshotWorld(tester, fullyStocked: fullyStocked);
  final device = target.device(title);

  final router = await pumpRecipathApp(
    tester,
    world: world,
    device: device,
    initialLocation: initialLocation,
  );

  if (navigate != null) {
    await navigate(router, world);
    await settleApp(tester);
  }

  await captureMarketingShot(tester, device, goldenFileName);
}

Future<void> captureDualPhoneDashboard(
  WidgetTester tester,
  MarketingTarget target,
  String title,
) async {
  final world = await setUpScreenshotWorld(tester);
  final device = target.device(title);
  final theme = world.container.read(themeDataProvider);

  GoRouter dashboardRouter(double scrollOffset) {
    final controller = ScrollController(initialScrollOffset: scrollOffset);
    addTearDown(controller.dispose);

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => PrimaryScrollController(
            controller: controller,
            child: const DashboardScreen(),
          ),
        ),
      ],
      initialLocation: '/dashboard',
    );
    addTearDown(router.dispose);
    return router;
  }

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: world.container,
      child: DeviceBox.fromDevice(
        device: device,
        child: DualPhoneShot(
          title: title,
          statusBar: target.statusBar,
          back: recipathMaterialApp(theme: theme, router: dashboardRouter(330)),
          front: recipathMaterialApp(theme: theme, router: dashboardRouter(0)),
        ),
      ),
    ),
  );
  await settleApp(tester);

  await captureMarketingShot(
    tester,
    device,
    'dashboard',
    finder: find.byType(DualPhoneShot),
  );
}
