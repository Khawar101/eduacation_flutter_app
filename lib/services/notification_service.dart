import 'dart:developer';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:education/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
   showNotification(String title,String body) async{
    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails(
        "channelId", "channelName",
        priority: Priority.high, importance: Importance.max);

    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

  await  notificationsPlugin.show(
        0, title, body, notiDetails);
  }


    FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("User authorized notification permission");
      getFCMDeviceToken();
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("User authorized provisional notification permission");
      getFCMDeviceToken();
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      AppSettings.openAppSettings();

      log("User denied notification permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      log("User still does not determine notification permission");
    }
  }

  Future<String> getFCMDeviceToken() async {
    String? token = await messaging.getToken();
    log("FCM token is $token");
    return token!;
  }

  Future initLocalNotification() async {
    if (Platform.isIOS) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings();

      var initializationSettings = const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }
  }

  void initFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((event) {
      showFirebaseNotification(event);
    });
  }

  showFirebaseNotification(RemoteMessage message) {
    initLocalNotification();
    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails notificationDetails =
        NotificationDetails(iOS: iosNotificationDetails);
    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, notificationDetails);
    });
  }

  @pragma("vm:entry-point")
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    NotificationService().showFirebaseNotification(message);
  }

 
}
