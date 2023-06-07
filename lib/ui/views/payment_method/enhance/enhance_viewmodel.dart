import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class EnhanceViewModel extends BaseViewModel {
  bool isChecked = false;
  bool isChecked1 = false;
  update(value) {
    isChecked = !isChecked;
    notifyListeners();
  }

  update1(value) {
    log("df33333gd$value");
    isChecked1 = !isChecked1;
    notifyListeners();
  }

  final _navigationService = locator<NavigationService>();

  navigateentercarddata() {
    _navigationService.navigateToCarddataView();
  }
}
