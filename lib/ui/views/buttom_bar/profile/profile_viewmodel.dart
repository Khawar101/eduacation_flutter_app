import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateEditProfile() {
    log('====>not move');
    _navigationService.navigateToEditInfoView();
  }

  navigateSetting() {
    log('====>not move');
    _navigationService.navigateToSettingView();
  }
}
