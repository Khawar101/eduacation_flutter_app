import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';

import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';

class RateingService {
  final _loginService = locator<LoginService>();

  String message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  rateNow(reviewCTRL, rateting, CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    String review = reviewCTRL.text.trim();

    if (review == "") {
      message = "Please enter review";
    } else {
      try {
        await firestore.collection("users").doc().set({
          "UID": _userData.uID,
          "courseKey": courseData.publishDate,
          "name": _userData.username,
          "profile": _userData.profile,
          "review": review,
          "rateting": rateting,
        });
        message = "Login Successfully";
      } catch (e) {
        message = e.toString();
      }
    }
  }
}
