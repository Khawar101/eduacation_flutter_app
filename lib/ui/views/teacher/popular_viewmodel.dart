import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class PopularViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatebookingview() {
    _navigationService.navigateToBookingView();
  }
}
