import 'package:education/services/Model/CoursesModel.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/courses_service.dart';
import 'package:education/services/Model/userData.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class TeacherProfileViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();
  final _courseService = locator<CoursesService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  userData get userInfo => _loginService.UserData;

  navigateToBackScreen() {
    _navigationService.back();
    notifyListeners();
  }

  var pathData;
  Future<Iterable<CoursesModel>> teacherData() async {
    final pathData = await FirebaseFirestore.instance
        .collection('courses')
        .where('UID', isEqualTo: _loginService.UserData.uID)
        .where('publishDate', isEqualTo: _courseService.publisherStream)
        .get();
    final userData = pathData.docs.map((e) => CoursesModel.fromJson(e.data()));
    log(pathData.toString());
    log(userData.toString());
    return userData;
  }

  // showProject(courseKey) async {
  //   await _courseService.showProject(courseKey);
  //   notifyListeners();
  // }
}
