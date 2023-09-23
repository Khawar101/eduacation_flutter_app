// ignore_for_file: file_names
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import '../favouritesub_viewmodel.dart';

class FavoriteCourseCard extends StackedView<FavouritesubViewModel> {
  final CoursesModel courseData;
  const FavoriteCourseCard(this.courseData, {Key? key}) : super(key: key);
  @override
  void onViewModelReady(FavouritesubViewModel viewModel) {
    viewModel.viewModelReady();
  }

  @override
  Widget builder(
    BuildContext context,
    FavouritesubViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () {
        viewModel.navigatefavoritecoursedetail(courseData);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                courseData.coverPic.toString(),
                fit: BoxFit.cover,
                height: 80,
                width: 100,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          courseData.title.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.checkCourseStatuspage(courseData);
                          },
                          child: Icon(
                              viewModel.favoriteCourses
                                      .contains(courseData.publishDate)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 20,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          wrapAlignment: WrapAlignment.start,
                          initialRating: courseData.rating ?? 5.0,
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
                            text: "\$${courseData.price.toString()}",
                            size: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      courseData.description.toString(),
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                      maxLines: 3,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Text(
                    //           '34',
                    //           style: GoogleFonts.ibmPlexSans(
                    //             color: Colors.black,
                    //             fontSize: 10,
                    //           ),
                    //         ),
                    //         const SizedBox(width: 3),
                    //         Text(
                    //           'Reviews',
                    //           style: GoogleFonts.ibmPlexSans(
                    //             color: Colors.black,
                    //             fontSize: 10,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text(
                    //           '100%',
                    //           style: GoogleFonts.ibmPlexSans(
                    //             color: Colors.black,
                    //             fontSize: 10,
                    //           ),
                    //         ),
                    //         const SizedBox(width: 3),
                    //         Text(
                    //           'Response Rate',
                    //           style: GoogleFonts.ibmPlexSans(
                    //             color: Colors.black,
                    //             fontSize: 10,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      ),
    );
  }

  @override
  FavouritesubViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavouritesubViewModel();
}
