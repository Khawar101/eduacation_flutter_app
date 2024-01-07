import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/courses_service.dart';
import 'package:education/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentInformationViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final coursesService = locator<CoursesService>();
  final _navigationService = locator<NavigationService>();

  userData get userInfo => _loginService.UserData;
  List<StudentProjects> get projects => coursesService.projectData;
}
