import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';
import 'dart:math' as math;

class LocalNotifications {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  const LocalNotifications(this._flutterLocalNotificationsPlugin);

  static final _modulo = math.pow(2, 31).toInt();
  static const _androidNotificationChannel = AndroidNotificationChannel(
    'default_importance_channel',
    'Default Importance Notifications',
    importance: Importance.defaultImportance,
  );

  Future<void> initAndSetup() async {
    initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_app_logo'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
      ),
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidNotificationChannel);
  }

  void scheduleNotification(int timestamp) async {
    final notificationTime =
        TZDateTime.fromMillisecondsSinceEpoch(local, timestamp);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      timestamp % _modulo,
      'Курс мог устареть',
      'Самое время обновить курс',
      notificationTime,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidNotificationChannel.id,
          _androidNotificationChannel.name,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
