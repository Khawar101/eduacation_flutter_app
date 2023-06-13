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
      firstName: data.firstName ?? "",
      lastName: data.lastName ?? "",
      phoneNo: data.phoneNo ?? "",
      address: data.address ?? "",
      clas: data.clas ?? "",
    );
    rebuildUi();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }
}
