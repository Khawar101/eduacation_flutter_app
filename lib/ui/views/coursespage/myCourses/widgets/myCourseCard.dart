import 'package:education/services/Model/CoursesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../widgets/networkImage.dart';
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
      onTap: viewModel.navigatecoursedetail,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              networkImage(courseData.coverPic, 80, 100, false),
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
                          "Physics",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.ibmPlexSans(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: viewModel.update(context),
                          child: Icon(
                            viewModel.isPressed
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: viewModel.isPressed
                                ? const Color(0xff4873a6).withOpacity(0.7)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      ignoreGestures: true,
                      itemPadding: const EdgeInsets.only(right: 6),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 12,
                        color: const Color(0xff4873a6).withOpacity(0.7),
                      ),
                      onRatingUpdate: (rating) {
                        // ignore: avoid_print
                        print(rating);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '34',
                              style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Reviews',
                              style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '100%',
                              style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Response Rate',
                              style: GoogleFonts.ibmPlexSans(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
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
