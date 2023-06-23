import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../../../../../app/app.locator.dart';

class MarketingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateonBack(BuildContext context) {
    // log('====>not move');
    MediaQuery.of(context).orientation == Orientation.portrait;
    _navigationService.back();

  }

  navigateCourses() {
    // log('====>not move');
    _navigationService.navigateToLessonsView();
  }
  navigateListOfCourses() {
    _navigationService.navigateToCoursesView();
  }
}
