// ignore_for_file: sdk_version_since

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/reportModel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/services/Model/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../app/app.locator.dart';
import 'Model/EbookModel.dart';
import 'login_service.dart';
import 'dart:developer';

class SubscriptionService {
  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();

  var message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  buyCourse(CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    List courseList = _userData.buyCourses ?? [];
    try {
      String key = "${_userData.uID}${courseData.publishDate}";
      courseList.add(courseData.publishDate);
      log(courseList.toString());
      await firestore.collection("users").doc(_userData.uID).update({
        "buyCourses": courseList,
      });
      await firestore.collection("courses").doc(courseData.publishDate).update({
        "students": courseData.students ?? 0 + 1,
      });
      await firestore.collection("subscription").doc(key).set({
        "key": key,
        "courseKey": courseData.publishDate,
        "publishKey": courseData.uID,
        "userKey": _userData.uID,
        "progress": 0.0,
        "courseName": courseData.title,
        "rating": 0.0,
        "startDate": DateTime.timestamp(),
        "endDate": DateTime.timestamp(),
        "lecture": []
      });
      _loginService.updateUserData(_userData.uID);

      // log(user.toString());
      _navigationService.back();
      message = "Course buy Successfully";
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:buyCourse(CourseModel courseData)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  buyEbook(EbookModel eBookData) async {
    userData _userData = _loginService.UserData;
    List eBookList = _userData.buyEBooks ?? [];
    try {
      String key = "${_userData.uID}${eBookData.publishDate}";
      eBookList.add(eBookData.publishDate);
      log(eBookList.toString());
      var eBookStudents = eBookData.students! + 1;
      await firestore.collection("users").doc(_userData.uID).update({
        "buyEBooks": eBookList,
      });
      await firestore.collection("E Books").doc(eBookData.publishDate).update({
        "students": eBookStudents,
      });
      await firestore.collection("subscription").doc(key).set({
        "key": key,
        "eBookKey": eBookData.publishDate,
        "publishKey": eBookData.uID,
        "userKey": _userData.uID,
        "progress": 0.0,
        "eBookName": eBookData.title,
        "rating": 0.0,
        "startDate": DateTime.timestamp(),
        "endDate": DateTime.timestamp(),
        "lecture": []
      });
      _loginService.updateUserData(_userData.uID);

      // log(user.toString());
      _navigationService.back();
      message = "Ebook buy Successfully";
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:buyEbook(EbookModel eBookData)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  Stream reportStream(courseKey) {
    try {
      return FirebaseFirestore.instance
          .collection("subscription")
          .doc("${_loginService.UserData.uID}$courseKey")
          .snapshots();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:reportStream(courseKey)",
          printDetails: true,
          fatal: true);
      log(e.toString());
      return Stream.error(e.toString());
    }
  }

  updateLecture(
      CoursesModel courseData, ReportModel reportData, String url) async {
    userData _userData = _loginService.UserData;
    List lectureList = reportData.lecture ?? [];
    var _progress =
        ((lectureList.length + 1) / courseData.lecture!.length) * 100;
    try {
      lectureList.add(url);
      log(url.toString());
      await firestore
          .collection("subscription")
          .doc("${_loginService.UserData.uID}${courseData.publishDate}")
          .update({
        "lecture": lectureList,
        "progress": _progress,
      });
      _loginService.updateUserData(_userData.uID);
      // log(user.toString());
      // _navigationService.back();
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:updateLecture()", printDetails: true, fatal: true);
      log(e.toString());
    }
  }
}
