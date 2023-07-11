import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';
import 'Model/userData.dart';
import 'login_service.dart';

class FavoriteCoursesService {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  var message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addfavoriteCourse(CoursesModel courseData) async {
    print("add to favorite");
    userData _userData = _loginService.UserData;
    List courseList = _userData.favoriteCourses ?? [];
    try {
      courseList.add(courseData.publishDate);
      print(courseList.toString());
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      _navigationService.back();
      message = "Added To Favorite Successfully";
      return(true);
    } catch (e) {
      message = e.toString();
    }
  }

  removefavoriteCourse(CoursesModel courseData) async {
    print("remove from favorite");
    userData _userData = _loginService.UserData;
    List courseList = _userData.favoriteCourses ?? [];
    log("=============>" + courseList.toString());
    courseList.remove(courseData.publishDate);
    try {
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      message = "Added To Favorite Successfully";
      return(false);
    } catch (e) {
      message = e.toString();
    }
  }
  
}
