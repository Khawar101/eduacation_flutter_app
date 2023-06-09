import 'package:firebase_auth/firebase_auth.dart';

class ForgetpasswordService {
  void _changePassword(String password) async {
    //Create an instance of the current user.
    var user = await FirebaseAuth.instance.currentUser;

    //Pass in the password to updatePassword.
    user!.updatePassword(password).then((_) {
      print("Successfully changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
