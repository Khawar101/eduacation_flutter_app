import 'package:education/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import 'widgets/ratingNow.dart';

class CoursedetailViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();

  TextEditingController reviewCtrl =
      TextEditingController();

  rateNow(context, courseData) {
    ratingNow(context, reviewCtrl, courseData, _loginService.UserData,
        notifyListeners);
  }
}
