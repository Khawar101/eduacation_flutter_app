import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/userData.dart';

import '../app/app.locator.dart';
import 'login_service.dart';

class SubscriptionService {
  final _loginService = locator<LoginService>();

  var message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  buyCourse(CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    try {
      String key = "${_userData.uID}${courseData.publishDate}";
      await firestore.collection("users").doc(_userData.uID).set({
        "buyCourses": {_userData.buyCourses ?? [].add(courseData.publishDate)},
      });
      await firestore.collection("subscription").doc(key).set({
        "key": key,
        "coursekey": courseData.publishDate,
        "userKey": _userData.uID,
        "progress": 0.0,
      });
      // log(user.toString());

      message = "Course buy Successfully";
    } catch (e) {
      message = e.toString();
    }
  }
}
