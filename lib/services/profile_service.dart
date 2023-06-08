// ignore_for_file: unrelated_type_equality_checks
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/userData.dart';
import '../app/app.locator.dart';
import 'login_service.dart';

class ProfileService {
  var message = "";
  final loginService = locator<LoginService>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateProfile(String email, password, firstName, lastName) async {
    if (loginService.UserData.email == email.trim &&
        loginService.UserData.password == password) {
      try {
        loginService.UserData =
            userData(firstName: firstName, lastName: lastName);
        await firestore
            .collection("users")
            .doc(loginService.UserData.uID)
            .update({
          "firstName": firstName,
          "lastName": lastName,
        });

        message = "Login Successfully";
      } catch (e) {
        message = e.toString();
      }
    } else {
      message = "Enter your correct email & password";
    }
  }
}
