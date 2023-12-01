// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, prefer_typing_uninitialized_variables
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:education/services/signup_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/app/app.router.dart';
import '../../../../app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  String userType = "Student";
  var profile;
  final _navigationService = locator<NavigationService>();
  final _signupService = locator<SignupService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  changeGender(value) {
    userType = value;
    notifyListeners();
  }

  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }

  TextEditingController nameCTRL = TextEditingController(text: "xyz");
  TextEditingController emailCTRL =
      TextEditingController(text: "khawarjutt101@gmail.com");
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");
  // signUP() async {
  //   await _signupService.createAccount(
  //       nameCTRL, emailCTRL, passwordCTRL, userType);
  //   if (_signupService.message == '') {
  //     log("sign up now...");
  //     // _navigationService.navigateToVerifyView();
  //   } else {
  //     log("try again...");
  //   }
  //   log("=====>${_signupService.message}");
  // }

  uploadProfile() async {
    try {
      await _signupService.pickImage().whenComplete(() {
        if (_signupService.message != '') {
          log("Profile uploded successfully...");
          // _navigationService.navigateToVerifyView();
          profile = _signupService.profile;
          log('2====>$profile');
          notifyListeners();
        } else {
          log("try again...");
        }
        log("=====>${_signupService.message}");
      });
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:uploadProfile()", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  sendOtp() async {
    try {
      await _signupService.sendOtpS(
          nameCTRL, emailCTRL, passwordCTRL, userType);
      if (_signupService.message == 'OTP has been sent') {
        log("sign up now...");
        _navigationService.navigateToVerifyView();
      } else {
        log("try again...");
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:sendOtp()", printDetails: true, fatal: true);
      log(e.toString());
    }
    log("=====>${_signupService.message}");
  }
}





