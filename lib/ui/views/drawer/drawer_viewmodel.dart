import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class DrawerViewModel extends BaseViewModel {

   final _navigationService = locator<NavigationService>();

  navigatebottomdashboard() {
    _navigationService.navigateToButtomBarView();
  }

}
