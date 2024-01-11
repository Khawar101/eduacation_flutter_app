import '../../../../services/favorite_courses_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:education/services/login_service.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/courses_service.dart';
import '../../../../services/Model/userData.dart';
import 'package:education/app/app.router.dart';
import '../../../../app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class LessonsScreenViewModel extends BaseViewModel {
  static List<String> itemsnames = [
    'Class Schedule',
    'Studying',
    'Saved',
    'Course details',
    'Lesson Content(50)',
    '120 Reviews'
  ];
  final _favoriteCourseService = locator<FavoriteCoursesService>();
  final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();
  final _loginService = locator<LoginService>();
  var favoriteCourses = [];
  var buyCourses = [];

  viewModelReady() {
    userData _userData = _loginService.UserData;
    favoriteCourses = _userData.favoriteCourses ?? [];
    buyCourses = _userData.buyCourses ?? [];
  }

  checkSubscripNavigate(CoursesModel courseData) {
    //buyCourses = _loginService.UserData.buyCourses ?? [];
    viewModelReady();
    notifyListeners();
    log(buyCourses.toString());
    if (buyCourses.contains(courseData.publishDate)) {
      log("buy course");
      _navigationService.navigateToCoursedetailView(courseData: courseData);
    } else {
      _navigationService.navigateToMarketingView(data: courseData);
    }
  }

  navigateNotifications() {
    _navigationService.navigateToNotificationView();
  }

  checkCourseStatus(CoursesModel courseData) async {
    if (!favoriteCourses.contains(courseData.publishDate)) {
      _favoriteCourseService.addfavoriteCourse(courseData);
    } else {
      _favoriteCourseService.removefavoriteCourse(courseData);
    }
    viewModelReady();
    notifyListeners();
  }
}
