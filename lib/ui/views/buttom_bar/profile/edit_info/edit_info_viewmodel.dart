import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../services/login_service.dart';

class EditInfoViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();
  final loginService = locator<LoginService>();

  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }

  TextEditingController firstNameCTRL = TextEditingController();
  TextEditingController lastNameCTRL = TextEditingController();
  TextEditingController phoneNoCTRL = TextEditingController();
  TextEditingController addressCTRL = TextEditingController();
  updatedProfile() async {
    await _profileService.updateProfile(phoneNoCTRL.text, addressCTRL.text,
        firstNameCTRL.text, lastNameCTRL.text);
    notifyListeners();
    if (_profileService.message == 'update successfully') {
      log("=====>${_profileService.message}");
      _navigationService.back();
      rebuildUi();
    } else {
      log("=====>${_profileService.message}");
    }
  }
}
