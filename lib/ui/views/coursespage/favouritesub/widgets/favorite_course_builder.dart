import 'package:education/app/app.locator.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/favorite_courses_service.dart';
import 'package:education/ui/views/coursespage/favouritesub/widgets/favoriteCourseCard.dart';
import 'package:education/utils/loading.dart';
import 'package:flutter/material.dart';


final favoritecoursesService = locator<FavoriteCoursesService>();
Widget favoritecousesBuilder(courseKey) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<CoursesModel>>(
        stream: favoritecoursesService.favoriteCoursesStream(courseKey),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loading(100));
          }
          if (snapshot.hasData) {
            return FavoriteCourseCard(snapshot.data[0]);
          }

          return const Text(
            "No Data Available",
            style: TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }