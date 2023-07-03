import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';

import '../app/app.locator.dart';
import 'Model/CoursesModel.dart';
import 'Model/ratingModel.dart';

class RatingService {
  final _loginService = locator<LoginService>();

  String message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;




  Stream<List<RatingModel>> ratingStream() {
    final stream = FirebaseFirestore.instance.collection("Rating").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return RatingModel.fromJson(doc.data());
        }).toList());
  }



  rateNow(reviewCTRL, rating, CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    String review = reviewCTRL.text.trim();

    if (review == "") {
      message = "Please enter review";
    } else {
      try {
        var key = "${_userData.uID}${courseData.publishDate}";
        await firestore.collection("Rating").doc(key).set({
          "UID": _userData.uID,
          "courseKey": courseData.publishDate,
          "name": _userData.username,
          "profile": _userData.profile,
          "review": review,
          "rating": rating,
          "date": DateTime.timestamp(),
        });
        message = "Rate Successfully";
      } catch (e) {
        message = e.toString();
      }
    }
  }
}
