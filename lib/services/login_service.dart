// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unrelated_type_equality_checks
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'Model/userData.dart';

class LoginService {
  var message = "";
  late userData UserData = userData();

// bool looding=true;
  // String number = numberCTRL.text.trim();

  // FlutterSecureStorage storage = const FlutterSecureStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  logins(emailCTRL, passwordCTRL) async {
    final UserCredential user;

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
          status: data["status"],
          educationSector: data["educationSector"],
          // socialLinks: data["socialLinks"],
          buyCourses: data["buyCourses"],
          buyEBooks: data["buyEBooks"],
          favoriteCourses: data["favoriteCourses"],
        );
        message = "login successfully";
        return UserData;
      } else {
        message = "Please fill all text field";
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function: logins(emailCTRL, passwordCTRL)",
          printDetails: true,
          fatal: true);
      message = e.toString();
    }
  }

  updateUserData(id) async {
    try {
      final DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("users").doc(id).get();
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
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:updateUserData(id)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
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

  void setOnlineStatus(bool status) async {
    try {
      // final userDoc = firestore.collection('chats').doc(loginService.UserData.uID);
      await firestore
          .collection('users')
          .doc(UserData.uID)
          .update({"status": status});
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:setOnlineStatus(bool status)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }
}
