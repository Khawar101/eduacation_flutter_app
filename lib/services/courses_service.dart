import 'package:education/services/Model/EbookModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/login_service.dart';
import 'package:education/app/app.locator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'Model/CoursesModel.dart';
import 'dart:developer';

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

  late CoursesModel courseData = CoursesModel(
      uID: _loginService.UserData.uID ?? "UaRZTAS3CYOE79s79cYeSNoANPa2",
      publisherData: PublisherData(
        name: _loginService.UserData.username ?? "Mudassir",
        email: _loginService.UserData.email ?? "xyz@gmail.com",
        profile: _loginService.UserData.profile ??
            "https://firebasestorage.googleapis.com/v0/b/education-app-b5aed.appspot.com/o/profile%2F1686228451064708?alt=media&token=7c093e32-23fd-432b-b7ba-a914cb4b5317",
      ));

  Stream<List<CoursesModel>> addProject(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("courses")
        .doc(courseKey)
        .collection("UploadProject")
        .where("publishDate", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }

  List<StudentProjects> projectData = [];
  Future<void> showProject(courseKey) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("courses")
              .doc(courseKey)
              .collection('projectData')
              .where('uid', isEqualTo: _loginService.UserData.uID)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        projectData = querySnapshot.docs
            .map((doc) => StudentProjects.fromJson(doc.data()))
            .toList();

        log("Project Data: $projectData");
      } else {
        log("No project data found for uID: ${_loginService.UserData.uID} in course: $courseKey");
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:showProject(coursekey)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }
}
