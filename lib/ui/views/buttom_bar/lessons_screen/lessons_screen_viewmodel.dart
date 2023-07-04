import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:education/services/login_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/courses_service.dart';
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
  final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();
  final _loginService = locator<LoginService>();

  checkSubscripNavigate(CoursesModel courseData) {
    log("------------${_loginService.UserData.buyCourses}");
    _loginService.UserData.buyCourses?.map((e) {
      log(e.toString());
      if (e == courseData.publishDate) {
        _navigationService.navigateToCoursedetailView(courseData: courseData);
        return null;
      }
    });
    // _navigationService.navigateToMarketingView(data: courseData);
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
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return GridView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
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
                    Image.network(
                      data.coverPic.toString(),
                      fit: BoxFit.cover,
                      height: 130,
                      width: 300,
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
                                  Text(
                                    data.title.toString(),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold),
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
                                      size: 17,
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
                          child: Text(
                            data.description.toString(),
                            style: const TextStyle(
                                color: Colors.black45,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold),
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
}
