import 'package:education/app/app.router.dart';
import 'package:education/services/Model/userData.dart';
// import 'package:education/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/login_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final loginService = locator<LoginService>();
  navigateEditProfile(userData data) async {
    await _navigationService.navigateToEditInfoView(
        email: data.email.toString(),
        password: data.password.toString(),
        firstName: data.firstName.toString(),
        lastName: data.lastName.toString());
    rebuildUi();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }
}
