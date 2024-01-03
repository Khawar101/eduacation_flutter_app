import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/signup_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class VerifyViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _signupService = locator<SignupService>();

  final List<String> _codes = ['', '', '', '', '', ''];
  List<String> get codes => _codes;
  onKeyboardTap(String value, context) {
    try {
      for (var i = 0; i < _codes.length; i++) {
        if (_codes[i].isEmpty) {
          _codes[i] = value;
          notifyListeners();
          if (i < _codes.length - 1) {
            // Move focus to the next text field
            FocusScope.of(context).nextFocus();
            notifyListeners();
          } else {
            // Last text field, perform your logic here (e.g., submitting the code)
          }
          break;
        }
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:onKeyboardTap(String value, context)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  void clearCodeField(int index, context) {
    try {
      if (index > 0 && _codes[index].isEmpty) {
        // Clear the current field and move focus to the previous field
        _codes[index - 1] = '';
        notifyListeners();
        FocusScope.of(context).previousFocus();
      } else {
        // Clear the current field
        _codes[index] = '';
        notifyListeners();
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "function:clearCodeField(int index, context)",
          printDetails: true,
          fatal: true);
      log(e.toString());
    }
  }

  verifyOtp() async {
    try {
      var otp = _codes.reduce((value, element) => value + element);

      await _signupService.verify(otp);
      if (_signupService.message == 'verify correct') {
        log("otp is correct congratulation");
        _navigationService.navigateToButtomBarView();
      } else {
        log("try again...");
      }
      log("=====>${_signupService.message}");
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s,
          reason: "verifyOtp", printDetails: true, fatal: true);
      log(e.toString());
    }
  }

  navigateapplication() {
    _navigationService.navigateToButtomBarView();
  }
}
