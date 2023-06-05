import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ForgetViewModel extends BaseViewModel {
  bool visibleCheck = true;
  bool visibleCheck2 = true;

  final _navigationService = locator<NavigationService>();

  navigateLogin() {
    _navigationService.navigateToLoginView();
  }
}
