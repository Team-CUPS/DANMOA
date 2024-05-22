import 'dart:async';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalPushNotifications {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
  static final StreamController<String?> notificationStream = StreamController<String?>.broadcast();
  
  static void onNotificationTap(NotificationResponse notificationResponse) {
    notificationStream.add(notificationResponse.payload);
  }


static Future init() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('danmoa_std');
  const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings();
  const LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(defaultActionName: 'Open notification');
    
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
  );
  
  
  if (Platform.isAndroid) {
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }
  
  _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: onNotificationTap,
    onDidReceiveBackgroundNotificationResponse: onNotificationTap,
  );
  }

  // 간단한 푸시 알림 보내기
  static Future showSimpleNotification({
      required String title,
      required String body,
      required String payload,
  }) async {
      // Android 알림 세부 설정
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          'channel_1', 'channel_1_name',
          channelDescription: 'channel 1 description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          sound: RawResourceAndroidNotificationSound("notice_alarm"),
      );

      // 통합 알림 세부 설정
      const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

      // 알림 보여주기
      await _flutterLocalNotificationsPlugin.show(
          0, title, body, notificationDetails, payload: payload
      );
  }

}