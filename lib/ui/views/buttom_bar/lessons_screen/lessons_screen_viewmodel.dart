import 'dart:developer';
import 'package:education/app/app.router.dart';
import 'package:education/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/Model/userData.dart';
import '../../../../services/courses_service.dart';
import '../../../../services/favorite_courses_service.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/app_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      log("bury course");
      _navigationService.navigateToCoursedetailView(courseData: courseData);
    } else {
      _navigationService.navigateToMarketingView(data: courseData);
    }
  }

  navigateNotifications() {
    _navigationService.navigateToNotificationView();
  }

  Widget coursesBuilder() {
    return StreamBuilder<List<CoursesModel>>(
      stream: coursesService.coursesStream(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading(100);
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: 250,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data![index];
            return GestureDetector(
              onTap: () {
                checkSubscripNavigate(data);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image.network(
                          data.coverPic.toString(),
                          fit: BoxFit.cover,
                          height: 130,
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              checkCourseStatus(data);
                            },
                            child: Icon(
                                favoriteCourses.contains(data.publishDate)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 20,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: data.title.toString(),
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1,
                                  ),
                                  RatingBar.builder(
                                    wrapAlignment: WrapAlignment.start,
                                    initialRating: data.rating ?? 5.0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    onRatingUpdate: (rating) {
                                      //print(rating);
                                    },
                                  ),
                                  CustomText(
                                      text: "\$${data.price.toString()}",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CustomText(
                            text: data.description.toString(),
                            color: Colors.black45,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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
