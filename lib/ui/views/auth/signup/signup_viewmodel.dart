// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison
import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  String gender = "male";
  var profile;
  final _navigationService = locator<NavigationService>();
  final _signupService = locator<SignupService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  changeGender(value) {
    gender = value;
    notifyListeners();
  }

  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }

  TextEditingController nameCTRL = TextEditingController(text: "xyz");
  TextEditingController emailCTRL =
      TextEditingController(text: "khawarjutt101@gmail.com");
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");
  signUP() async {
    await _signupService.createAccount(nameCTRL, emailCTRL, passwordCTRL);
    if (_signupService.message == '') {
      log("sign up now...");
      // _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
  }

  uploadProfile() async {
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
  }

  sendOtp() async {
    await _signupService.sendOtpS(nameCTRL, emailCTRL, passwordCTRL);
    if (_signupService.message == 'OTP has been sent') {
      log("sign up now...");
      _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
  }
}
