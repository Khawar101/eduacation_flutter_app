import 'package:education/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class VerifyViewModel extends BaseViewModel {
    List<String> codes = ['', '', '', '', '', ''];

   onKeyboardTap(String value,context) {
    for (var i = 0; i < codes.length; i++) {
      if (codes[i].isEmpty) {
          codes[i] = value;
        if (i < codes.length - 1) {
          // Move focus to the next text field
          FocusScope.of(context).nextFocus();
        } else {
          // Last text field, perform your logic here (e.g., submitting the code)
        }
        break;
      }
    }
  }

  void clearCodeField(int index,context) {
    if (index > 0 && codes[index].isEmpty) {
      // Clear the current field and move focus to the previous field
        codes[index - 1] = '';
      FocusScope.of(context).previousFocus();
    } else {
      // Clear the current field
        codes[index] = '';
    }
  }
  final _navigationService = locator<NavigationService>();

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }
}
