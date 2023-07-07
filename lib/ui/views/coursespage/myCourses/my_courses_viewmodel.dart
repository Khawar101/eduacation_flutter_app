import 'package:education/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/courses_service.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/app_utils.dart';
import 'widgets/myCourseCard.dart';

class MyCoursesViewModel extends BaseViewModel {
  bool isPressed = false;
  update(value) {
    isPressed = !isPressed;
  }

  final _navigationService = locator<NavigationService>();
  final coursesService = locator<CoursesService>();

  navigatefavouritesubject() {
    _navigationService.navigateToFavouritesubView();
    notifyListeners();
  }

  navigatecoursedetail() {
    // _navigationService.navigateToCoursedetailView();
    notifyListeners();
  }

  Widget coursesBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<CoursesModel>>(
        stream: coursesService.coursesStream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading(100);
          }
          if (snapshot.hasData == true) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  var _courseData = snapshot.data![index];

                  return MyCoursesCard(_courseData);
                });
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
                  // checkSubscripNavigate(data);
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
      ),
    );
  }
}
