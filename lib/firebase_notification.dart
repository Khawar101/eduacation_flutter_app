import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotification {
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseNotification get instance => FirebaseNotification();

  Future showNotificationWithDefaultSound(String title, String message) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel_id', 'channel_name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  Future _onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {}

  Future _selectNotification(String? payload) async {}

  Future initLocalNotification() async {
    if (Platform.isIOS) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      // final IOSInitializationSettings initializationSettingsIOS =
      //     IOSInitializationSettings(
      //         onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

      // var initializationSettings = InitializationSettings(
      //     android: initializationSettingsAndroid,
      //     iOS: initializationSettingsIOS);
      // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      //     onSelectNotification: _selectNotification);
    } else {
      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      // var initializationSettingsIOS = IOSInitializationSettings(
      //     onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
      // var initializationSettings = InitializationSettings(
      //     android: initializationSettingsAndroid,
      //     iOS: initializationSettingsIOS);

      // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      //     onSelectNotification: _selectNotification);
    }
  }

  Future takeFCMTokenWhenAppLaunch() async {
    try {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }

      // onMessage is called in foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print(message.notification!.title);
        print(message.notification!.body);

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification!.android;

        final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();

        const AndroidNotificationChannel channel = AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          // description
          importance: Importance.max,
        );

        void pushShowNotification(int code, String title, String message) {
          flutterLocalNotificationsPlugin.show(
            code,
            title,
            message,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,

                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  icon: 'launch_background',
                ),
                iOS: const DarwinNotificationDetails(
                  presentSound: true,
                  presentAlert: true,
                )),
          );
        }

        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  icon: 'launch_background',
                ),
                iOS: const DarwinNotificationDetails(
                  presentSound: true,
                  presentAlert: true,
                )),
          );
        }

        pushShowNotification(message.notification.hashCode,
            message.notification!.title!, message.notification!.body!);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        log('app is open');
        log('A new onMessageOpenedApp event was published!');
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
