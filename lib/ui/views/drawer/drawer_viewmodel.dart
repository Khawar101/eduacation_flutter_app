import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class DrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatebottomdashboard() {
    _navigationService.navigateToButtomBarView();
    notifyListeners();
  }

  navigatecontact() {
    _navigationService.navigateToContactView();
  }

  navigatePopularTeacher() {
    _navigationService.navigateToPopularView();
  }

  navigateELearning() {
    _navigationService.navigateToPopularView();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }

  navigateEbook() {
    _navigationService.navigateToPopularView();
  }

  navigateListOfCourses() {
    _navigationService.navigateToPopularView();
  }

  navigateAcount() {
    _navigationService.navigateToAcountView();
  }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }
}
