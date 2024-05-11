// ignore_for_file: non_constant_identifier_names
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/userData.dart';
import '../app/app.locator.dart';
import 'login_service.dart';
import 'dart:developer';

class ProfileService {
  var message = "";
  final loginService = locator<LoginService>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateProfile(firstName, lastName, phoneNo, address, clas) async {
    // log("${UserData.email == email}, ${UserData.password == password}, ${UserData.email}, $email");
    var UserData = loginService.UserData;
    var uid = UserData.uID.toString();
    try {
      log({
        "firstName": firstName,
        "lastName": lastName,
        "phoneNo": phoneNo,
        "address": address,
        "clas": clas,
      }.toString());
      if (firstName != null &&
          phoneNo != null &&
          lastName != null &&
          address != null &&
          clas != null) {
        try {
          UserData = userData(
            firstName: firstName,
            lastName: lastName,
            phoneNo: phoneNo,
            address: address,
            clas: clas,
          );
          await firestore.collection("users").doc(uid).update({
            "firstName": firstName,
            "lastName": lastName,
            "phoneNo": phoneNo,
            "address": address,
            "clas": clas,
          });
          await loginService.updateUserData(uid);
          message = "update successfully";
        } catch (e, s) {
          FirebaseCrashlytics.instance.recordError(e, s,
              reason: "function:updateProfile",
              printDetails: true,
              fatal: true);
          message = e.toString();
        }
      } else {
        message = "Filed all TextField";
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:updateProfile", printDetails: true, fatal: true);
      log(e.toString());
    }
  }
}
