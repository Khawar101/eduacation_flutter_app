import 'package:education/app/app.router.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/coursespage/favouritesub/widgets/favoriteCourseCard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/Model/userData.dart';
import '../../../../services/favorite_courses_service.dart';
import '../../../../services/login_service.dart';
import '../../../../utils/loading.dart';

class FavouritesubViewModel extends BaseViewModel {
  bool data = false;

  final _navigationService = locator<NavigationService>();
  final favoritecoursesService = locator<FavoriteCoursesService>();
  final loginService = locator<LoginService>();
  navigatefavoritecoursedetail(CoursesModel courseData) {
    _navigationService.navigateToCoursedetailView(courseData: courseData);
    notifyListeners();
  }

  final _favoriteCourseService = locator<FavoriteCoursesService>();
  final _loginService = locator<LoginService>();
  var favoriteCourses = [];
  var buyCourses = [];

  viewModelReady() {
    userData _userData = _loginService.UserData;
    favoriteCourses = _userData.favoriteCourses ?? [];
    buyCourses = _userData.buyCourses ?? [];
  }

  Widget favoritecousesBuilder(courseKey) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<CoursesModel>>(
        stream: favoritecoursesService.favoriteCoursesStream(courseKey),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading(100));
          }
          if (snapshot.hasData) {
            return FavoriteCourseCard(snapshot.data[0]);
          }

          return Text("No Data Available");
        },
      ),
    );
  }

  checkCourseStatuspage(CoursesModel courseData) async {
    if (!favoriteCourses.contains(courseData.publishDate)) {
      _favoriteCourseService.addfavoriteCourse(courseData);
    } else {
      _favoriteCourseService.removefavoriteCourse(courseData);
    }
    viewModelReady();
    notifyListeners();
  }
}
