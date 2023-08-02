import 'package:education/services/Model/CoursesModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/app_utils.dart';

Widget courseintro(context, CoursesModel courseData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BigText(
        text: courseData.title.toString(),
        color: Colors.black,
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    size: 16,
                  ),
                  const SizedBox(width: 7),
                  Text(courseData.duration.toString(),
                      style: GoogleFonts.ibmPlexSans(fontSize: 12)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 16,
                  ),
                  const SizedBox(width: 7),
                  Text("${courseData.rating} (${courseData.students})",
                      style: GoogleFonts.ibmPlexSans(fontSize: 12)),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.videocam_sharp,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 7),
                  Text("${courseData.chapter} Lessons",
                      style: GoogleFonts.ibmPlexSans(fontSize: 12)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                  ),
                  const SizedBox(width: 7),
                  Text("${courseData.students} students",
                      style: GoogleFonts.ibmPlexSans(fontSize: 12)),
                ],
              )
            ],
          ),
        ],
      ),
    ],
  );
}
