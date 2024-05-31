import '../../../../../services/subscription_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../services/courses_service.dart';
import '../../../../../services/rating_service.dart';
import 'package:education/app/app.router.dart';
import '../../../../../app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MarketingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final ratingService = locator<RatingService>();
  final coursesService = locator<CoursesService>();

  final _subscriptionService = locator<SubscriptionService>();
  navigateonBack(BuildContext context) {
    // log('====>not move');
    MediaQuery.of(context).orientation == Orientation.portrait;
    _navigationService.back();
  }

  navigateCourses() {
    // log('====>not move');
    _navigationService.navigateToLessonsView();
  }

  // navigateCoursedetail(courseData) {
  //   _navigationService.navigateToCoursedetailView(courseData: courseData);
  // }

  buyCourse(courseData) {
    _subscriptionService.buyCourse(courseData);
  }
}
