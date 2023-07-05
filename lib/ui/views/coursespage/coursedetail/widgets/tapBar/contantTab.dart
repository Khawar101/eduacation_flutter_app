// ignore_for_file: unnecessary_import

import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/reportModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../app/app.locator.dart';
import '../../../../../../services/subscription_service.dart';
import '../../../../../../utils/loading.dart';
import '../../../../../widgets/app_utils.dart';
import '../../coursedetail_viewmodel.dart';

Widget contant(
    context, CoursesModel courseData, CoursedetailViewModel viewModel) {
  final _subscriptionService = locator<SubscriptionService>();

  return SizedBox(
      child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Column(
      children: [
        StreamBuilder(
          stream: _subscriptionService.reportStream(courseData.publishDate),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading(20);
            }
            ReportModel _reportData =
                ReportModel.fromJson(snapshot.data.data());
            return ListView.builder(
                shrinkWrap: true,
                itemCount: courseData.lecture!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Lecture lecture = courseData.lecture![index];
                  return InkWell(
                    onTap: () {
                      viewModel.updateLession(courseData, _reportData,
                          courseData.lecture![index].videoUrl);
                    },
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        lecture.thumbnail.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lecture.title.toString(),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 10),
                                ReadMoreText(
                                  lecture.description.toString(),
                                  trimLines: 2,
                                  trimLength: 70,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7)),
                                  colorClickableText: Colors.black,
                                  trimMode: TrimMode.Length,
                                  trimCollapsedText: 'Read more',
                                  moreStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  trimExpandedText: '...Show Less',
                                  lessStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Assigments",
            style: GoogleFonts.ibmPlexSans(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: courseData.assigment!.length,
            itemBuilder: (context, index) {
              Assigment assigment = courseData.assigment![index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(203, 203, 6, 6)
                                .withOpacity(0.7),
                          ),
                          child: Center(
                              child: Text(
                            ".pdf",
                            style: GoogleFonts.ibmPlexSans(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonText(
                              text: assigment.title!,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              assigment.description!,
                              style: GoogleFonts.ibmPlexSans(
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Image.asset(
                    //   'assets/icons/download-cloud.png',
                    //   width: 26,
                    //   color: const Color(0xFF4873A6).withOpacity(0.7),
                    // )
                  ],
                ),
              );
            })
      ],
    ),
  )); // SECOND ITEM
}
