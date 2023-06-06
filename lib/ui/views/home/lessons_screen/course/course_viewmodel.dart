import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';

class CourseViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateonBack() {
    // log('====>not move');
    _navigationService.back();
  }

  navigateLerners() {
    // log('====>not move');
    _navigationService.navigateToLearnersView();
  }
}
