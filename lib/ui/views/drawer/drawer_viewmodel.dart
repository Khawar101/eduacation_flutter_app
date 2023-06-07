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
    _navigationService.navigateToELearningView();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }

  navigateEbook() {
    _navigationService.navigateToEBookView();
  }

  navigateListOfCourses() {
    _navigationService.navigateToCoursesView();
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
