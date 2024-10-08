// ignore_for_file: file_names
import 'package:stacked_services/stacked_services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/Model/CoursesModel.dart';
import 'package:education/app/app.router.dart';
import '../../services/courses_service.dart';
import '../../services/Model/userData.dart';
import 'package:flutter/material.dart';
import '../../app/app.locator.dart';
import '../../utils/loading.dart';
import 'app_utils.dart';

Widget introBuilder(CoursesModel coursesModel) {
  final coursesService = locator<CoursesService>();
  final navigation = locator<NavigationService>();

  return StreamBuilder(
    stream: coursesService.publisherStream(coursesModel.uID),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Loading(20);
      }
      userData _userData = userData.fromJson(snapshot.data.data());
      return GestureDetector(
        onTap: () {
          navigation.navigateToTeacherProfileView(courseData: coursesModel);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(_userData.profile.toString()),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_userData.username.toString(),
                        style: GoogleFonts.ibmPlexSans(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    ButtonText(text: _userData.userType!, color: Colors.black45)
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
