import 'package:education/app/app.router.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';
import '../../../../services/courses_service.dart';
import '../../../../utils/loading.dart';
import 'widgets/myCourseCard.dart';

class MyCoursesViewModel extends BaseViewModel {
  bool isPressed = false;
  update(value) {
    isPressed = !isPressed;
  }

  final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();
  final loginService = locator<LoginService>();

  navigatefavouritesubject() {
    _navigationService.navigateToFavouritesubView();
    notifyListeners();
  }

  navigatecoursedetail(courseData) {
    _navigationService.navigateToCoursedetailView(courseData: courseData.projectData);
    notifyListeners();
  }

  Widget cousesBuilder(courseKey) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<CoursesModel>>(
        stream: coursesService.buyCoursesStream(courseKey),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading(100));
          }
          if (snapshot.hasData) {
            return MyCoursesCard(snapshot.data[0]);
          }
          return const Text("No Data Available");
        },
      ),
    );
  }
}
