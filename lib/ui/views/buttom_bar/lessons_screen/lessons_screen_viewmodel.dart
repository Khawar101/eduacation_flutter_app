import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class LessonsScreenViewModel extends BaseViewModel {
  static List<String> itemsnames = [
    'Class Schedule',
    'Studying',
    'Saved',
    'Course details',
    'Lesson Content(50)',
    '120 Reviews'
  ];
  final _navigationService = locator<NavigationService>();

  navigateMarketing() {
    // log('====>not move');
    _navigationService.navigateToMarketingView();
  }
}
