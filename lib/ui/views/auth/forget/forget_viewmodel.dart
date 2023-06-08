// ignore_for_file: non_constant_identifier_names

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class ForgetViewModel extends BaseViewModel {
  bool visibleCheck = true;
  bool visibleCheck2 = true;

  final _navigationService = locator<NavigationService>();
  visible_check() {
    visibleCheck = !visibleCheck;
    notifyListeners();
  }

  visible_check2() {
    visibleCheck2 = !visibleCheck2;
    notifyListeners();
  }

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }
}
