import 'package:education/ui/views/coursespage/coursedetail/coursedetail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../widgets/app_utils.dart';

Widget feedback(context, courseData) {
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
                              "4.7",
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
                              "753",
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
            // ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemCount: 3,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 15),
            //         child: Column(
            //           children: [
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 const CircleAvatar(
            //                   radius: 20,
            //                   backgroundImage:
            //                       AssetImage('assets/images/profile-pic.jpg'),
            //                 ),
            //                 SizedBox(
            //                     width:
            //                         MediaQuery.of(context).size.width * 0.03),
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     const ButtonText(
            //                         text: "@mouni", color: Colors.black),
            //                     const SizedBox(
            //                       height: 2,
            //                     ),
            //                     SizedBox(
            //                       width:
            //                           MediaQuery.of(context).size.width - 110,
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           RatingBar.builder(
            //                             wrapAlignment: WrapAlignment.start,
            //                             initialRating: 2.5,
            //                             minRating: 1,
            //                             direction: Axis.horizontal,
            //                             allowHalfRating: true,
            //                             itemCount: 5,
            //                             itemSize: 15,
            //                             itemBuilder: (context, _) => const Icon(
            //                               Icons.star,
            //                               color: Colors.yellow,
            //                             ),
            //                             onRatingUpdate: (rating) {
            //                               //print(rating);
            //                             },
            //                           ),
            //                           Text(
            //                             "11 min ago",
            //                             style: GoogleFonts.ibmPlexSans(
            //                                 fontSize: 12,
            //                                 color: Colors.black45,
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 8),
            //             ReadMoreText(
            //               'The Flutter framework builds its layout via the word composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
            //               trimLines: 2,
            //               trimLength: 80,
            //               style:
            //                   TextStyle(color: Colors.black.withOpacity(0.7)),
            //               colorClickableText: Colors.black,
            //               trimMode: TrimMode.Length,
            //               trimCollapsedText: 'Read more',
            //               moreStyle: const TextStyle(
            //                   color: Colors.black, fontWeight: FontWeight.bold),
            //               trimExpandedText: '...Show Less',
            //               lessStyle: const TextStyle(
            //                   color: Colors.black, fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       );
            //     }),
         
         
         
            const SizedBox(height: 30),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF4873A6).withOpacity(0.7),
              ),
              child: const Center(
                  child: ButtonText(text: 'Load more', color: Colors.white)),
            ),
          ],
        );
      });
}
