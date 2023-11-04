import 'package:education/ui/views/buttom_bar/lessons_screen/marketing/marketing_widgets/rating_Builder.dart';
import 'package:education/ui/views/coursespage/coursedetail/coursedetail_viewmodel.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

Widget feedback(context, CoursesModel courseData) {
  return ViewModelBuilder<CoursedetailViewModel>.reactive(
      viewModelBuilder: () => CoursedetailViewModel(),
      builder: (BuildContext context, CoursedetailViewModel viewModel,
          Widget? child) {
        return Column(
          children: [
            Text(
              "Feedback",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff4873a6).withOpacity(0.7)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 22,
                              color: const Color(0xff4873a6).withOpacity(0.7),
                            ),
                            const SizedBox(width: 08),
                            Text(
                              courseData.rating.toString(),
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Reviews",
                        style: GoogleFonts.ibmPlexSans(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff4873a6).withOpacity(0.7)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 22,
                              color: const Color(0xff4873a6).withOpacity(0.7),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${courseData.students ?? 0}",
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Students",
                        style: GoogleFonts.ibmPlexSans(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Write a Review:",
                  style: GoogleFonts.ibmPlexSans(fontSize: 13),
                ),
                IconButton(
                    onPressed: () {
                      viewModel.rateNowAlert(context, courseData, viewModel);
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
            ratingBuilder(courseData),
            const SizedBox(height: 30),
            // Container(
            //   height: 40,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: const Color(0xFF4873A6).withOpacity(0.7),
            //   ),
            //   child: const Center(
            //       child: ButtonText(text: 'Load more', color: Colors.white)),
            // ),
          ],
        );
      });
}
