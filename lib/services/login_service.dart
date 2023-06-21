// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/shared_preferences.dart';
import 'Model/userData.dart';

class LoginService {
  var message = "";
  late userData UserData;

// bool looding=true;
  // String number = numberCTRL.text.trim();

  // FlutterSecureStorage storage = const FlutterSecureStorage();

  logins(emailCTRL, passwordCTRL) async {
    final UserCredential user;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String useremail = emailCTRL.text.trim();
    final String userpassword = passwordCTRL.text;
    try {
      if (useremail != '' && userpassword != '') {
        user = await auth.signInWithEmailAndPassword(
            email: useremail, password: userpassword);
        final DocumentSnapshot snapshot =
            await firestore.collection("users").doc(user.user?.uid).get();
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
          educationSector: data["educationSector"],
          socialLinks: data["socialLinks"],
        );
        message = "login successfully";
        return UserData;
      } else {
        message = "Please fill all text field";
      }
    } catch (e) {
      message = e.toString();
    }
  }

  updateUserData() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(UserData.uID)
        .get();
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
        phoneNo: data["phoneNo"],
        address: data["address"],
        clas: data["clas"]);
  }

  profileComplete() {
    var profile_complete = 0;

    if (UserData.username != null) {
      profile_complete += 10;
    }
    if (UserData.firstName != null) {
      profile_complete += 10;
    }
    if (UserData.lastName != null) {
      profile_complete += 10;
    }
    if (UserData.email != null) {
      profile_complete += 10;
    }
    if (UserData.phoneNo != null) {
      profile_complete += 10;
    }
    if (UserData.clas != null) {
      profile_complete += 10;
    }
    if (UserData.userType != null) {
      profile_complete += 10;
    }
    if (UserData.profile != null) {
      profile_complete += 10;
    }
    if (UserData.address != null) {
      profile_complete += 10;
    }
    if (UserData.socialLinks != null) {
      profile_complete += 10;
    }

    return profile_complete;
  }
}
