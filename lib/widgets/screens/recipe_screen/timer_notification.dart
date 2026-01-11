import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:recipath/application/notification_service.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:timezone/timezone.dart' as tz;

const int _timersNotificationId = 1001;

Future<void> showTimersRunningNotification() async {
  final androidPlugin = notifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  final permission =
      await androidPlugin?.requestNotificationsPermission() ?? false;

  if (permission) {
    final androidDetails = AndroidNotificationDetails(
      'active_timers',
      'Active timers',
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
}

Future<void> cancelTimersNotification() async {
  await cancelNotification(_timersNotificationId);
}

Future<void> scheduleStepNotification({
  required int id,
  required int index,
  required RecipeData recipe,
  required DateTime scheduledAt,
}) async {
  final androidPlugin = notifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  final notificationPermission =
      await androidPlugin?.requestNotificationsPermission() ?? false;

  if (notificationPermission) {
    final exactPermission =
        await androidPlugin?.requestExactAlarmsPermission() ?? false;

    final localizations = await AppLocalizations.delegate.load(
      WidgetsBinding.instance.platformDispatcher.locale,
    );

    await notifications.zonedSchedule(
      id,
      localizations.stepTimerFinishedTitle,
      localizations.stepTimerFinishedBody(index + 1, recipe.title),
      tz.TZDateTime.from(scheduledAt, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'step_timer_channel',
          'Step timer notification',
          importance: Importance.max,
          priority: Priority.high,
          visibility: NotificationVisibility.public,
        ),
      ),
      payload: jsonEncode({recipeIdKey: recipe.id}),
      androidScheduleMode: exactPermission
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}

Future<void> cancelNotification(int id) async {
  await notifications.cancel(id);
}
