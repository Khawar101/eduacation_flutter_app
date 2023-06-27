import 'package:education/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/rateing_service.dart';
import 'widgets/ratingNow.dart';

class CoursedetailViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final rateingService = locator<RateingService>();

  TextEditingController reviewCtrl = TextEditingController();
  var rateting;

  rateNowAlert(context, courseData, viewModel) {
    ratingNow(context, courseData, viewModel, notifyListeners);
  }

  getRating(value) {
    rateting = value;
    notifyListeners();
  }

  postRating(courseData, context) {
    rateingService.rateNow(reviewCtrl, rateting, courseData);
    reviewCtrl.clear;
    notifyListeners();
    Navigator.pop(context);
  }
}
