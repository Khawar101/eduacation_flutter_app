import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class FavouritesubViewModel extends BaseViewModel {
  bool data = false;

   final _navigationService = locator<NavigationService>();


 navigatecoursedetail() {
    _navigationService.navigateToCoursedetailView();
    notifyListeners();
  }
}
