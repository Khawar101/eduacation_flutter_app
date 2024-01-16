import 'package:education/services/Model/userData.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class TeacherProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  userData? UserData;
  userData? get userInfo => UserData;

  navigateToBackScreen() {
    _navigationService.back();
    notifyListeners();
  }

  getUserData(uid) async {
    setBusy(true);
    try {
      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(uid).get();
      // storage.write(key: "UID", value: user.user?.uid);
      // final data = snapshot.data();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      UserData = userData(
        uID: data["UID"],
        username: data["username"],
        firstName: data["firstName"],
        lastName: data["lastName"],
        email: data["email"],
        password: data["password"],
        profile: data["profile"],
        userType: data["userType"],
        gender: data["gender"],
        phoneNo: data["phoneNo"],
        address: data["address"],
        clas: data["clas"],
        status: data["status"],
        educationSector: data["educationSector"],
        // socialLinks: data["socialLinks"],
        buyCourses: data["buyCourses"],
        buyEBooks: data["buyEBooks"],
        favoriteCourses: data["favoriteCourses"],
      );
      setBusy(false);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
    setBusy(false);

    // showProject(courseKey) async {
    //   await _courseService.showProject(courseKey);
    //   notifyListeners();
  }
}
