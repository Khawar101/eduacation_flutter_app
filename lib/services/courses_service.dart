import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/EbookModel.dart';
import 'package:education/services/login_service.dart';
import 'Model/CoursesModel.dart';

class CoursesService {
  final _loginService = locator<LoginService>();
  Stream<List<CoursesModel>> coursesStream() {
    final stream = FirebaseFirestore.instance.collection("courses").snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }

  Stream publisherStream(uID) {
    return FirebaseFirestore.instance.collection("users").doc(uID).snapshots();
  }

  Stream<List<CoursesModel>> buyCoursesStream(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("courses")
        .where("publishDate", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }

    // late CoursesModel courseData = CoursesModel(
    //   uID: _loginService.UserData.uID ?? "UaRZTAS3CYOE79s79cYeSNoANPa2",
    //   publisherData: PublisherData(
    //     name: _loginService.UserData.username ?? "Mudassir",
    //     email: _loginService.UserData.email ?? "xyz@gmail.com",
    //     profile: _loginService.UserData.profile ??
    //         "https://firebasestorage.googleapis.com/v0/b/education-app-b5aed.appspot.com/o/profile%2F1686228451064708?alt=media&token=7c093e32-23fd-432b-b7ba-a914cb4b5317",
    //   ));
}
