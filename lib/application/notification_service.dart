import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const androidSettings = AndroidInitializationSettings(
    '@drawable/ic_launcher_monochrome',
  );

  const settings = InitializationSettings(android: androidSettings);

  await notifications.initialize(settings);

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
}
