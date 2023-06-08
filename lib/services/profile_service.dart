import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  var message = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateProfile(firstName, lastName) async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var userdata = {
        "firstName": firstName,
        "lastName": lastName,
      };
      await firestore.collection("users").doc(uid).update(userdata);

      message = "Login Successfully";
    } catch (e) {
      message = e.toString();
    }
  }
}
