import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class BookingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatedetail() {
    _navigationService.navigateToDetailView();
  }

  navigateNotification() {
    _navigationService.navigateToNotificationView();
  }
}
