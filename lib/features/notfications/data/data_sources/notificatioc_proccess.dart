import 'dart:convert';
import 'dart:developer';

import 'package:find_your_teacher/features/notfications/data/data_sources/topic_subscribe.dart';
import 'package:find_your_teacher/features/notfications/presentation/pages/teacher_notifaction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_routes.dart';
import '../../../../firebase_options.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import 'notification_local_data_source.dart';



class NotificationProcess {
  NotificationProcess._();

  static void handleNotification(String? payload) {
    var context = router.routerDelegate.navigatorKey.currentContext;
    context!.pushNamed(NotificationScreen.name);
  }

  static Future<String> get fcmToken async =>
      await FirebaseMessaging.instance.getToken() ?? '';

  static void onMessage() async {
    log("FCM ${await fcmToken}");
    FirebaseMessaging.onMessage.listen((event) {
      log("event.notification.body ${event.notification?.body}");
      log("event.notification.title ${event.notification?.title}");
      log("event.data ${event.data.toString()}");
      LocalNotificationService.showNotificationWithPayload(message: event);
    });
    await _setupInteractedMessage();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  static Future<void> subscribeToTopicBasedOnRole() async {
    final role = await AuthImpLocalDataSource().getRole();

    if (role == TypeUser.teacher) {
      subscribeToTopic("teachers");
      subscribeToTopic("ALL");
    } else if (role == TypeUser.student) {
      subscribeToTopic("students");
      subscribeToTopic("ALL");
    }
  }
  static Future<void> subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage event) async {
    // LocalNotificationService.showNotificationWithPayload(message: event);

  }
  //
  // static void onRefreshToken({required Function(String fcmToken) onRefresh}) {
  //   FirebaseMessaging.instance.onTokenRefresh.listen(onRefresh);
  // }

  static Future<void> _setForegroundNotificationPresentationOptions() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
  }

  static requestPermissionIos() async {
    // if (Platform.isIOS || Platform.isMacOS) {
    await FirebaseMessaging.instance.requestPermission();
    // }
  }

  static Future<void> _setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleNotification(json.encode(initialMessage.data));
    }
    // handleTappedNotificationOnTerminatedState();
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleNotification( json.encode(event.data));
    });
  }

  static Future<void> deleteToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }

  static handleTappedNotificationOnTerminatedState() async {
    var details = await LocalNotificationService
        .localNotificationPlugin
        .getNotificationAppLaunchDetails();
    if (details != null) {
      if (details.didNotificationLaunchApp) {
        handleNotification(details.notificationResponse?.payload);
      }
    }
  }

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await requestPermissionIos();
      await _setForegroundNotificationPresentationOptions();
      await LocalNotificationService.initialize();
    } catch (e) {
      rethrow;
    }
  }
}
