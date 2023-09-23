// ignore_for_file: file_names

import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/reportModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../../widgets/app_utils.dart';
import '../../coursedetail_viewmodel.dart';

class Contant extends ViewModelWidget<CoursedetailViewModel> {
  final CoursesModel courseData;
  final ReportModel _reportData;

  const Contant(
    this.courseData,
    this._reportData, {
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    CoursedetailViewModel viewModel,
  ) {
// Widget contant(context, CoursesModel courseData,
//     CoursedetailViewModel viewModel, ReportModel _reportData) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListView.builder(
            shrinkWrap: true,
            itemCount: courseData.lecture!.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Lecture lecture = courseData.lecture![index];
              bool _complete = false;
              for (var i = 0; i < _reportData.lecture!.length; i++) {
                if (lecture.videoUrl == _reportData.lecture![i]) {
                  _complete = true;
                }
              }
              return InkWell(
                onTap: () {
                  viewModel.updateVideo(
                      courseData.lecture![index].videoUrl, _complete);
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    _complete ? Icons.check : Icons.play_arrow,
                                    size: 20,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              )),
                          Positioned(
                            bottom: -5,
                            right: -5,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  lecture.duration.toString(),
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.ibmPlexSans(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              lecture.description.toString(),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Column(
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
