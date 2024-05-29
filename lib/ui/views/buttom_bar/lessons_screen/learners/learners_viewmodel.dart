import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import 'package:stacked/stacked.dart';

class LearnersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateonBack() {
    _navigationService.back();
  }
}
