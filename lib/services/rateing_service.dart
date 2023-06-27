import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';

import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';
import 'Model/ratingModel.dart';

class RateingService {
  final _loginService = locator<LoginService>();

  String message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;




  Stream<List<RatingModel>> coursesStream() {
    final stream = FirebaseFirestore.instance.collection("courses").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return RatingModel.fromJson(doc.data());
        }).toList());
  }



  rateNow(reviewCTRL, rateting, CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    String review = reviewCTRL.text.trim();

    if (review == "") {
      message = "Please enter review";
    } else {
      try {
        var key = "${_userData.uID}${courseData.publishDate}";
        await firestore.collection("Rateing").doc(key).set({
          "UID": _userData.uID,
          "courseKey": courseData.publishDate,
          "name": _userData.username,
          "profile": _userData.profile,
          "review": review,
          "rateting": rateting,
        });
        message = "Rate Successfully";
      } catch (e) {
        message = e.toString();
      }
    }
  }
}
