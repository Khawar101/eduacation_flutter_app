// ignore_for_file: sdk_version_since
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Model/CoursesModel.dart';
import '../app/app.locator.dart';
import 'Model/ratingModel.dart';
import 'dart:developer';

class RatingService {
  final _loginService = locator<LoginService>();

  String message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<RatingModel>> ratingStream(courseKey) {
    try {
      final stream = FirebaseFirestore.instance
          .collection("Rating")
          .where("courseKey", isEqualTo: courseKey)
          .snapshots();
      return stream.map((event) => event.docs.map((doc) {
            return RatingModel.fromJson(doc.data());
          }).toList());
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:reatingStream", printDetails: true, fatal: true);
      return Stream.error(e.toString());
    }
  }

  rateNow(reviewCTRL, rating, CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    String review = reviewCTRL.text.trim();
    try {
      if (review == "") {
        message = "Please enter review";
      } else {
        try {
          log("======>${courseData.rating}");
          var courseKey = courseData.publishDate;
          await firestore.collection("courses").doc(courseKey).update({
            "rating": (courseData.rating ?? 5 + rating) / 2,
          });
          var key = "${_userData.uID}$courseKey";
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
        } catch (e, s) {
          FirebaseCrashlytics.instance.recordError(e, s,
              reason: "function:rateNow", printDetails: true, fatal: true);
          log(e.toString());
        }
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:rateNow", printDetails: true, fatal: true);
      log(e.toString());
    }
  }
}
