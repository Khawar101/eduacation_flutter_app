import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'Model/CoursesModel.dart';
import '../app/app.locator.dart';
import 'Model/userData.dart';
import 'login_service.dart';
import 'dart:developer';

class FavoriteCoursesService {
  final _loginService = locator<LoginService>();

  var message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addfavoriteCourse(CoursesModel courseData) async {
    log("add to favorite");
    userData _userData = _loginService.UserData;
    List courseList = _userData.favoriteCourses ?? [];
    try {
      courseList.add(courseData.publishDate);
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      //_navigationService.back();
      message = "Added To Favorite Successfully";
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:addfovoriteCourse(CourseModel courseData)",
          printDetails: true,
          fatal: true);
      message = e.toString();
    }
  }

  removefavoriteCourse(CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    List courseList = _userData.favoriteCourses ?? [];
    courseList.remove(courseData.publishDate);
    try {
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      message = "Added To Favorite Successfully";
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:removefavouriteCourse(CoursesModel courseData)",
          printDetails: true,
          fatal: true);
      message = e.toString();
    }
  }

  Stream<List<CoursesModel>> favoriteCoursesStream(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("courses")
        .where("publishDate", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }
}
