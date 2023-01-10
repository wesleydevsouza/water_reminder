import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static const int hoursPerDay = 24;

  static Future _notificationsDetails() async {
    // ignore: prefer_const_constructors
    return NotificationDetails(
      android: AndroidNotificationDetails('main_channel', 'Main Channel',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@drawable/ic_flutternotification'),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationsDetails(),
        payload: payload,
      );

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        //horas, minutos, segundos
        // _scheduleDaily(Time(8, 30, 23)),

        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationsDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

  static void init({bool initScheduled = false}) async {
    final android =
        AndroidInitializationSettings('@drawable/ic_flutternotification');
    final settings = InitializationSettings(android: android);

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        // onNotifications.add(payload);
      },
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);

//verificando se o dia ja passou e agendando para o próximo dia caso tenha passado do horário
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}
