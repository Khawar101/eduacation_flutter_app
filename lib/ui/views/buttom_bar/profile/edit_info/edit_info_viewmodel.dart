import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../services/login_service.dart';

class EditInfoViewModel extends BaseViewModel {
  final String email;
  final String password;
  final String fName;
  final String LName;  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();
  final loginService = locator<LoginService>();

  EditInfoViewModel(this.email, this.password, this.fName, this.LName);

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }

  TextEditingController emailCTRL = TextEditingController(text: "email");
  TextEditingController passwordCTRL = TextEditingController();
  TextEditingController firstNameCTRL = TextEditingController();
  TextEditingController lastNameCTRL = TextEditingController();
  updatedProfile() async {
    await _profileService.updateProfile(emailCTRL.text, passwordCTRL.text,
        firstNameCTRL.text, lastNameCTRL.text);
    notifyListeners();
    if (_profileService.message == 'update successfully') {
      log("=====>${_profileService.message}");
      _navigationService.back();
    } else {
      log("=====>${_profileService.message}");
    }
  }
}
