import 'dart:developer';

import 'package:education/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:education/app/app.bottomsheets.dart';
import 'package:education/app/app.dialogs.dart';
import 'package:education/app/app.locator.dart';
import 'package:education/app/app.router.dart';
import 'package:education/ui/common/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked_services/stacked_services.dart';
import 'firebase_options.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  AndroidInitializationSettings androidSetting =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  FirebaseMessaging.onBackgroundMessage(
      NotificationService.firebaseMessagingBackgroundHandler);

  DarwinInitializationSettings iosSetting = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestProvisionalPermission: true,
    requestSoundPermission: true,
  );

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSetting, iOS: iosSetting);

  bool? initialized =
      await notificationsPlugin.initialize(initializationSettings);
  log("Notification : $initialized");

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
      ),
      initialRoute: Routes.splashScreenView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}

// FirebaseFirestore firestore = FirebaseFirestore.instance;

// final User? user = FirebaseAuth.instance.currentUser;
// get_Data() async {
//   final DocumentSnapshot snapshot =
//       await firestore.collection("users").doc(user?.uid).get();
//   // storage.write(key: "UID", value: user.user?.uid);
//   if (snapshot.exists) {
//     return snapshot.data();
//   }
//   return null;
// }

// FutureBuilder(
//         future: get_Data(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Some thing Went Wrong");
//           }

//           // Once complete, show your application
//           if (snapshot.hasData) {
//             return BottomNavigBar(UserData: snapshot.data as Map);
//           }

//           // Otherwise, show something whilst waiting for initialization to complete
//           return signInScreen();
//         },
//       ),
