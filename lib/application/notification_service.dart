import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/common.dart';
import 'package:recipath/root_routes.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const androidSettings = AndroidInitializationSettings(
    '@drawable/ic_launcher_monochrome',
  );
  const DarwinInitializationSettings darwinSettings =
      DarwinInitializationSettings();

  const settings = InitializationSettings(
    android: androidSettings,
    iOS: darwinSettings,
  );

  await notifications.initialize(
    settings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      handleNotificationPayload(response.payload);
    },
  );

  final androidPlugin = notifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  const timerChannel = AndroidNotificationChannel(
    'active_timers',
    'Active timers',
    description: 'Shown while one or more timers are running',
    importance: Importance.low,
  );
  await androidPlugin?.createNotificationChannel(timerChannel);

  const stepTimerChannel = AndroidNotificationChannel(
    'step_timer_channel',
    'Step timer notification',
    description: "Shown when a step in the recipe is supposed to be finished",
    importance: Importance.max,
  );
  await androidPlugin?.createNotificationChannel(stepTimerChannel);

  tz.initializeTimeZones();
  tz.setLocalLocation(
    tz.getLocation((await FlutterTimezone.getLocalTimezone()).identifier),
  );

  final NotificationAppLaunchDetails? launchDetails = await notifications
      .getNotificationAppLaunchDetails();

  if (launchDetails?.didNotificationLaunchApp ?? false) {
    final payload = launchDetails?.notificationResponse?.payload;
    Future.delayed(
      Duration(seconds: 1),
      () => handleNotificationPayload(payload),
    );
  }
}

void handleNotificationPayload(String? payload) {
  if (payload == null) return;

  try {
    final Map<String, dynamic> data = jsonDecode(payload);

    if (data.containsKey(recipeIdKey)) {
      final recipeId = data[recipeIdKey];
      navigatorKey.currentContext?.go(
        '${RootRoutes.recipeRoute.path}/recipeOverview/$recipeId',
      );
    }
  } catch (_) {}
}
