import 'package:education/ui/views/buttom_bar/dashboard/widgets/bottomTitle.dart';
import 'package:education/ui/views/buttom_bar/dashboard/widgets/leftTitle.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:education/services/notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/app/app.router.dart';
import '../../../../app/app.locator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:education/main.dart';
import 'dart:developer';

class DashboardViewModel extends BaseViewModel {
  final bool isShowingMainData = true;

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 8,
        minY: 0,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        // lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => const LineTouchData(
        handleBuiltInTouches: true,
        // touchTooltipData: LineTouchTooltipData(color: Colors.black),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  SideTitles leftTitles() => const SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  SideTitles get bottomTitles => const SideTitles(
        showTitles: true,
        reservedSize: 33,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData =>
      const FlGridData(show: true, drawVerticalLine: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
              color: const Color(0xff4873a6).withOpacity(0.7), width: 1),
          left: BorderSide(
              color: const Color(0xff4873a6).withOpacity(0.7), width: 1),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.white,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 6),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );
  // final _NotificationService = locator<NotificationService>();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<String> getFCMDeviceToken() async {
    String? token = await messaging.getToken();
    log("FCM token is $token");
    return token!;
  }

  void showNotification() async {
    getFCMDeviceToken();
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.max,
            importance: Importance.max,
            channelDescription: "channel discription",
            visibility: NotificationVisibility.public);

    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    // await notificationsPlugin.show(
    //     0, "Sample Notification", "This is a notification", notiDetails);
    // DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));

    await notificationsPlugin.show(
        0, "Sample Notification", "This is a notification", notiDetails,
        payload: "notification-payload");

    log("on press noti");
    notifyListeners();
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if (response != null) {
          String? payload = response.payload;
          log("Notification Payload: $payload");
          notifyListeners();
        }
      }
    }
  }

  final _navigationService = locator<NavigationService>();

  navigateNotification() {
    _navigationService.navigateToNotificationView();
  }

  final _navigatonService = locator<NotificationService>();
  void showNoti(title, body) async {
    await _navigatonService.showNotification(title, body);
    notifyListeners();
  }

  void initNoti() async {
    await _navigatonService.initLocalNotification();
    _navigatonService.initFirebaseMessaging();
    notifyListeners();
  }
}
