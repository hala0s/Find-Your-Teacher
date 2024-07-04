import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notificatioc_proccess.dart';



class LocalNotificationService {
  LocalNotificationService._();

  static final _localNotificationPlugin = FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get localNotificationPlugin =>
      _localNotificationPlugin;

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =

    AndroidInitializationSettings('mipmap/launcher_icon');

    DarwinInitializationSettings iosInitializationSettings =
    const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    if (Platform.isAndroid) {
      _localNotificationPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
    }
    await _localNotificationPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
      onDidReceiveNotificationResponse: _onSelectNotification,
    );
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    log('id $id ,title $title,body $body,payload $payload');
  }

  static Future<void> showNotificationWithPayload(
      {required RemoteMessage message}) async {
    // final PayloadModel payloadModel = PayloadModel.fromJson(message.data);

    try {
      await _localNotificationPlugin.show(
        message.hashCode + DateTime.now().minute,
        message.notification?.title ?? "",
        message.notification?.body ?? "",
        _notificationDetails(),
        payload: json.encode(message.data),
      );
    } catch (e) {
    }
  }

  static void _onSelectNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null &&
        (notificationResponse.payload?.isNotEmpty ?? false)) {
      NotificationProcess.handleNotification(notificationResponse.payload);
    }
  }

  static _notificationDetails() {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      DateTime.now().toString(),
      "General ",
      channelDescription: "General Notification",
      importance: Importance.max,
      priority: Priority.max,
    );
    DarwinNotificationDetails iosNotificationDetails =
    const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }
}
