import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/teacher_model.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/courses_service.dart';
import 'package:education/services/login_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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

  // project data add and show

  // Future<List<CoursesModel>> showProject(courseKey, uID) async {
  //   try {
  //    var querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection("courses")
  //             .doc(courseKey)
  //             .collection('projectData')
  //             .where('uid', isEqualTo: uID)
  //             .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       log("=======>${querySnapshot}");
  //       querySnapshot.docs.forEach((doc) {
  //         log("Project Data: ${doc.data()}");
  //       });
  //     } else {
  //       log("No project data found for uID: $uID in course: $courseKey");
  //     }
  //   } catch (e) {
  //     log("======upload data===$e");
  //   }
  //   return [];
  // }
 List<DocumentSnapshot<Map<String, dynamic>>>? teacherList;

  Future<void> teacherData(courseKey) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .where('teacherUID', isEqualTo: _loginService.UserData.uID)
          .where('courseKey', isEqualTo: courseKey)
          .get();

      // Assign the result to the class-level variable
      teacherList = snapshot.docs;
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:teacherData(courseKey)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  // showProject(courseKey) async {
  //   await _courseService.showProject(courseKey);
  //   notifyListeners();
  // }
}
