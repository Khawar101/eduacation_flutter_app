import 'package:education/app/app.router.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utils/shared_preferences.dart';

class DrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();
  userData get UserData => _loginService.UserData;
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
    _navigationService.navigateToMyCoursesView();
  }

  navigateAcount() {
    _navigationService.navigateToAcountView();
  }

  navigateFavourit() {
    _navigationService.navigateToFavouritesubView();
  }

  removeDataFromSpAndGoToLogin() async {
    _navigationService.back();
    await Store.removeValueAgainstKey('userId');
    _loginService.setOnlineStatus(false);
    _navigationService.navigateToLoginView();
  }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }

  // navigatePopularTeacher() {
  //   _navigationService.navigateToContactView();
  // }
}
