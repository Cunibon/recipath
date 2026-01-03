import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recipath/application/notification_service.dart';
import 'package:recipath/l10n/app_localizations.dart';

const int _timersNotificationId = 1001;

Future<void> showTimersRunningNotification() async {
  final androidDetails = AndroidNotificationDetails(
    'active_timers',
    'Active timers',
    channelDescription: 'Shown while timers are running',
    importance: Importance.low,
    priority: Priority.low,
    ongoing: true,
    autoCancel: false,
    showWhen: false,
    category: AndroidNotificationCategory.service,
  );

  final details = NotificationDetails(android: androidDetails);

  final localizations = await AppLocalizations.delegate.load(
    WidgetsBinding.instance.platformDispatcher.locale,
  );

  await notifications.show(
    _timersNotificationId,
    localizations.timersRunningHeader,
    localizations.timersRunningDescription,
    details,
  );
}

Future<void> cancelTimersNotification() async {
  await notifications.cancel(_timersNotificationId);
}
