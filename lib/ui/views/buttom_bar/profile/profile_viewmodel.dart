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
      firstName: data.firstName.toString(),
      lastName: data.lastName.toString(),
      phoneNo: data.phoneNo.toString(),
      clas: data.clas.toString(),
      address: data.address.toString(),
    );
    rebuildUi();
  }

  navigateSetting() {
    _navigationService.navigateToSettingView();
  }
}
