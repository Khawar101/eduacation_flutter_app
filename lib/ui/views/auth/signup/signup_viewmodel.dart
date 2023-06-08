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
  final _navigationService = locator<NavigationService>();
  final _signupService = locator<SignupService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }

  TextEditingController nameCTRL = TextEditingController(text: "xyz");
  TextEditingController emailCTRL = TextEditingController(text: "mudassirmukhtar4@gmail.com");
  // TextEditingController numberCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");
  signUP() async {
    await _signupService.createAccount(nameCTRL, emailCTRL, passwordCTRL);
    if (_signupService.signupMessage == '') {
      log("sign up now...");
      // _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.signupMessage}");
  }

  sendOtp() async {
    await _signupService.sendOtpS(emailCTRL);
    if (_signupService.message == '') {
      log("sign up now...");
      // _navigationService.navigateToVerifyView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
  }

  // void sendOTP() async {
  //   String number = "+92" + numberCTRL.text.trim();
  //   String password = passwordCTRL.text.trim();
  //   // log(number);
  //   if (password.length < 6) {
  //     log('The password provided is too too weak.');
  //     return;
  //   }

  //   log(number);
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: number,
  //       codeSent: (verificationId, resendToken) {
  //         log(verificationId);
  //         log("resendToken");
  //         // Navigator.push(context, CupertinoPageRoute(builder: (context)=>  VerifyScreen(verificationId: verificationId) ));
  //       },
  //       verificationCompleted: (PhoneAuthCredential credential) {
  //         log("verification done");
  //       },
  //       verificationFailed: (ex) {
  //         print(ex.code.toString());
  //         log("verification failed");
  //       },
  //       codeAutoRetrievalTimeout: (verificationId) {},
  //       timeout: Duration(seconds: 60),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       log('The password provided is too too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       log('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
