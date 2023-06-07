// ignore_for_file: non_constant_identifier_names

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();
 
   visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }


  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }
}
