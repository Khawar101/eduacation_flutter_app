// ignore_for_file: file_names
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';
import '../my_courses_viewmodel.dart';

class MyCoursesCard extends StackedView<MyCoursesViewModel> {
  final CoursesModel courseData;
  const MyCoursesCard(this.courseData, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyCoursesViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () {
        viewModel.navigatecoursedetail(courseData);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //networkImage(courseData.coverPic, 80, 100, false),
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
                        // GestureDetector(
                        //   onTap: viewModel.update(context),
                        //   child: Icon(
                        //     viewModel.isPressed
                        //         ? Icons.favorite
                        //         : Icons.favorite_border,
                        //     color: viewModel.isPressed
                        //         ? const Color(0xff4873a6).withOpacity(0.7)
                        //         : Colors.grey,
                        //   ),
                        // ),
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
                            fontSize: 17,
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
  MyCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyCoursesViewModel();
}
