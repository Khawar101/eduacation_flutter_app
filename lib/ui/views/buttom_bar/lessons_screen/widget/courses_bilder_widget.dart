import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/buttom_bar/lessons_screen/lessons_screen_viewmodel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:education/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class CoursesBuilder extends ViewModelWidget<LessonsScreenViewModel> {
  const CoursesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    LessonsScreenViewModel viewModel,
  ) {
   return StreamBuilder<List<CoursesModel>>(
      stream:viewModel.coursesService.coursesStream(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading(100);
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: 255,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            var data = snapshot.data![index];
            return GestureDetector(
              onTap: () {
                viewModel.checkSubscripNavigate(data);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data.coverPic.toString(),
                            fit: BoxFit.cover,
                            height: 130,
                            width: 300,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                             viewModel.checkCourseStatus(data);
                            },
                            child: Icon(
                                viewModel.favoriteCourses.contains(data.publishDate)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 20,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: data.title.toString(),
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1,
                                  ),
                                  RatingBar.builder(
                                    wrapAlignment: WrapAlignment.start,
                                    initialRating: data.rating ?? 5.0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    onRatingUpdate: (rating) {
                                      //print(rating);
                                    },
                                  ),
                                  CustomText(
                                      text: "\$${data.price.toString()}",
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CustomText(
                            text: data.description.toString(),
                            color: Colors.black45,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
 
  }
}




  // Widget coursesBuilder() {
  //   return StreamBuilder<List<CoursesModel>>(
  //     stream: coursesService.coursesStream(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text(snapshot.error.toString());
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Loading(100);
  //       }
  //       return GridView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemCount: snapshot.data?.length ?? 0,
  //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //           maxCrossAxisExtent: 300,
  //           mainAxisExtent: 255,
  //           crossAxisSpacing: 8,
  //           mainAxisSpacing: 8,
  //         ),
  //         itemBuilder: (BuildContext context, int index) {
  //           var data = snapshot.data![index];
  //           return GestureDetector(
  //             onTap: () {
  //               checkSubscripNavigate(data);
  //             },
  //             child: Card(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Stack(
  //                     alignment: AlignmentDirectional.topEnd,
  //                     children: [
  //                       ClipRRect(
  //                         borderRadius: BorderRadius.circular(10),
  //                         child: Image.network(
  //                           data.coverPic.toString(),
  //                           fit: BoxFit.cover,
  //                           height: 130,
  //                           width: 300,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(10.0),
  //                         child: InkWell(
  //                           onTap: () {
  //                             checkCourseStatus(data);
  //                           },
  //                           child: Icon(
  //                               favoriteCourses.contains(data.publishDate)
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               size: 20,
  //                               color: Colors.red),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: [
  //                       Stack(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                               left: 8.0,
  //                               top: 8.0,
  //                             ),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 CustomText(
  //                                   text: data.title.toString(),
  //                                   textOverflow: TextOverflow.ellipsis,
  //                                   fontWeight: FontWeight.bold,
  //                                   maxLines: 1,
  //                                 ),
  //                                 RatingBar.builder(
  //                                   wrapAlignment: WrapAlignment.start,
  //                                   initialRating: data.rating ?? 5.0,
  //                                   minRating: 1,
  //                                   direction: Axis.horizontal,
  //                                   allowHalfRating: true,
  //                                   itemCount: 5,
  //                                   itemSize: 15,
  //                                   ignoreGestures: true,
  //                                   itemBuilder: (context, _) => const Icon(
  //                                     Icons.star,
  //                                     color: Colors.yellow,
  //                                   ),
  //                                   onRatingUpdate: (rating) {
  //                                     //print(rating);
  //                                   },
  //                                 ),
  //                                 CustomText(
  //                                     text: "\$${data.price.toString()}",
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: Colors.black),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(
  //                             horizontal: 8, vertical: 4),
  //                         child: CustomText(
  //                           text: data.description.toString(),
  //                           color: Colors.black45,
  //                           textOverflow: TextOverflow.ellipsis,
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 12,
  //                           maxLines: 2,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }