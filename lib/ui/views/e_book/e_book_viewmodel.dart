import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class EBookViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBookDetail() {
    _navigationService.navigateToBookDetailView();
  }

    navigateNotification() {
    _navigationService.navigateToNotificationView();
  }
    navigateBack() {
    _navigationService.back();
  }
}
