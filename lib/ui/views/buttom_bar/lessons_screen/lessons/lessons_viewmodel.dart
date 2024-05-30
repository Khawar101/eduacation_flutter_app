import 'package:stacked_services/stacked_services.dart';
import 'package:education/app/app.router.dart';
import '../../../../../app/app.locator.dart';
import 'package:stacked/stacked.dart';


class LessonsViewModel extends BaseViewModel {
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
