import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class DetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateSlectDate() {
    _navigationService.navigateToSdatetimeView();
  }
}
