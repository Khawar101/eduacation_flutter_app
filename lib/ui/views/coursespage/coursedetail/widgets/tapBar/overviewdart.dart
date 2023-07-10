// ignore_for_file: unnecessary_import
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/feedback.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/cupertino.dart';

Widget overview(context, CoursesModel courseData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Introduction",
        style: GoogleFonts.ibmPlexSans(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 8),
      ReadMoreText(
        courseData.description.toString(),
        trimLines: 3,
        trimLength: 100,
        style: TextStyle(
            color: Colors.black.withOpacity(0.7), height: 1.3, wordSpacing: 2),
        colorClickableText: Colors.black,
        trimMode: TrimMode.Length,
        trimCollapsedText: 'Read more',
        moreStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        trimExpandedText: '...Show Less',
        lessStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 30),
      feedback(context, courseData),
      // const SizedBox(height: 30),
      // project(context),
    ],
  );
}
