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
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      //_navigationService.back();
      message = "Added To Favorite Successfully";
    } catch (e) {
      message = e.toString();
    }
  }

  removefavoriteCourse(CoursesModel courseData) async {
    userData _userData = _loginService.UserData;
    List courseList = _userData.favoriteCourses ?? [];
    courseList.remove(courseData.publishDate);
    try {
      await firestore.collection("users").doc(_userData.uID).update({
        "favoriteCourses": courseList,
      });
      _loginService.updateUserData(_userData.uID);
      message = "Added To Favorite Successfully";
    } catch (e) {
      message = e.toString();
    }
  }
  Stream<List<CoursesModel>> favoriteCoursesStream(courseKey) {
    final stream = FirebaseFirestore.instance
        .collection("courses")
        .where("publishDate", isEqualTo: courseKey)
        .snapshots();
    return stream.map((event) => event.docs.map((doc) {
          return CoursesModel.fromJson(doc.data());
        }).toList());
  }
}
