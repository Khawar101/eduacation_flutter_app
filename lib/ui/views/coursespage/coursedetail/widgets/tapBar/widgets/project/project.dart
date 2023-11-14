// ignore_for_file: unnecessary_import
import 'package:education/ui/views/coursespage/coursedetail/widgets/tapBar/widgets/project/addproject/poster/poster_view.dart';
import 'package:education/ui/views/coursespage/coursedetail/coursedetail_viewmodel.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget project(
    context, CoursesModel courseData, CoursedetailViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Project by student",
            style: GoogleFonts.ibmPlexSans(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              viewModel.navigateAddProjectView(courseData);
            },
            child: Text(
              "Add projet",
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: courseData.studentProjects?.length ?? 1,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PosterView()));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/Paul-Wilson.jpg',
                          fit: BoxFit.cover,
                        ),
                      )),
                );
              }),
        ),
      ),
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
}


