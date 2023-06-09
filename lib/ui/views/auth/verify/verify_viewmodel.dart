import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/signup_service.dart';
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
  }

  void clearCodeField(int index, context) {
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
  }

  verifyOtp() async {
    var otp = _codes.reduce((value, element) => value + element);

    await _signupService.verify(otp);
    if (_signupService.message == 'verify correct') {
      log("otp is correct congratulation");
      _navigationService.navigateToButtomBarView();
    } else {
      log("try again...");
    }
    log("=====>${_signupService.message}");
  }

  navigateapplication() {
    _navigationService.navigateToButtomBarView();
  }
}
