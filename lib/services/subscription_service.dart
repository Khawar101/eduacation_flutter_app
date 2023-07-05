import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/reportModel.dart';
import 'package:education/services/Model/userData.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import 'login_service.dart';

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
    } catch (e) {
      message = e.toString();
    }
  }

  Stream reportStream(courseKey) {
    return FirebaseFirestore.instance
        .collection("subscription")
        .doc("${_loginService.UserData.uID}$courseKey")
        .snapshots();
  }

  updateLecture(
      CoursesModel courseData, ReportModel reportData, String url) async {
    userData _userData = _loginService.UserData;
    List lectureList = reportData.lecture ?? [];
    var _progress = lectureList.length * 100 / courseData.lecture!.length;
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
    } catch (e) {
      log(e.toString());
    }
  }
}
