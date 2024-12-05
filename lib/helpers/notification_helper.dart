import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationHelper {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static const int hoursPerDay = 24;

  static Future _notificationsDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'main_channel',
        'Main Channel',
        importance: Importance.max,
        priority: Priority.max,
        icon: '@drawable/ic_flutternotification',
      ),
    );
  }

  static bool _isWithinNotificationHours(int startHour, int endHour) {
    final now = DateTime.now();
    final hour = now.hour;
    return hour >= startHour && hour < endHour;
  }

  static Future<void> showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required RepeatInterval repeatInterval,
    required int startHour,
    required int endHour,
  }) async {
    if (_isWithinNotificationHours(startHour, endHour)) {
      await _notifications.periodicallyShow(
        id,
        title,
        body,
        repeatInterval,
        await _notificationsDetails(),
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

  static Future<bool> requestPermissions() async {
    print('Solicitando permissões de notificação...');
    final androidImplementation =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      final granted =
          await androidImplementation.requestNotificationsPermission();
      print('Permissão de notificação solicitada: $granted');
      return granted ?? false;
    }

    print(
        'AndroidImplementation é null, assumindo true para versões anteriores.');
    return true;
  }

  static Future<void> init({bool initScheduled = false}) async {
    const android =
        AndroidInitializationSettings('@drawable/ic_flutternotification');
    const settings = InitializationSettings(android: android);

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {},
    );

    final permissionsGranted = await requestPermissions();
    if (!permissionsGranted) {
      print('Permissões para notificações foram negadas.');
    }
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}
