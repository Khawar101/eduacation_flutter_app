import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CoursesViewModel extends BaseViewModel {
  bool isPressed = false;
  update(value) {
    isPressed = !isPressed;
  }

  final _navigationService = locator<NavigationService>();

  navigatefavouritesubject() {
    _navigationService.navigateToFavouritesubView();
    notifyListeners();
  }

  navigatecoursedetail() {
    _navigationService.navigateToCoursedetailView();
    notifyListeners();
  }
}
