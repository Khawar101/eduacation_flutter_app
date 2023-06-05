import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  bool visibleCheck = true;
  final _navigationService = locator<NavigationService>();

  navigateVerify() {
    _navigationService.navigateToVerifyView();
  }
}
