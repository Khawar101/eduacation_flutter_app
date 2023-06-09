// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        log(data["UID"]);
        UserData = userData(
            uID: data["UID"],
            username: data["username"],
            email: data["email"],
            password: data["password"],
            profile: data["profile"]);
        log(UserData.email.toString());
        message = "login successfully";
      } else {
        message = "Please fill all text field";
              
      }
    } catch (e) {
      message = e.toString();
    }
  }
}
