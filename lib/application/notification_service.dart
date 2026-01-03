import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const androidSettings = AndroidInitializationSettings(
    '@drawable/ic_launcher_monochrome',
  );

  const settings = InitializationSettings(android: androidSettings);

  await notifications.initialize(settings);

  // Android notification channel
  const channel = AndroidNotificationChannel(
    'active_timers',
    'Active timers',
    description: 'Shown while one or more timers are running',
    importance: Importance.low,
  );

  final androidPlugin = notifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  await androidPlugin?.createNotificationChannel(channel);

  await androidPlugin?.requestNotificationsPermission();
}
