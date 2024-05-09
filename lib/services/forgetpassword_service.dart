import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class ForgetpasswordService {
  void changePassword(String password) async {
    //Create an instance of the current user.
    var user = FirebaseAuth.instance.currentUser;

    //Pass in the password to updatePassword.
    user!.updatePassword(password).then((_) {
      log("Successfully changed password");
    }).catchError((error) {
      log("Password can't be changed  $error");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
