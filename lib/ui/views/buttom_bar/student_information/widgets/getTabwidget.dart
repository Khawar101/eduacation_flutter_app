// ignore_for_file: unnecessary_import, non_constant_identifier_names

import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/utils/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/app_utils.dart';

Widget Project(context, StudentInformationViewModel viewModel) {
  //  return StreamBuilder<List<CoursesModel>>(
  //     stream: viewModel.coursesService.coursesStream(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text(snapshot.error.toString());
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Loading(100);
  //       }
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: viewModel.coursesService.projectData.length,
        // 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      //  Image.network(
                      //     viewModel.coursesService.projectData[0].url.toString())
                      Image.asset(
                    'assets/images/Paul-Wilson.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
          );
        }),
  );
}

Widget Courses(context, StudentInformationViewModel viewModel) {
  return StreamBuilder<List<CoursesModel>>(
      stream: viewModel.coursesService.coursesStream(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Loading(100));
        }
        return Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  // 8,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data![index];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.02,
                          top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data.coverPic.toString(),
                                fit: BoxFit.cover,
                                height: 130,
                                width: 300,
                              ),
                              // Image.asset('assets/images/tree.jpg',
                              //     fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title.toString(),
                                  // "Adobe illustrator for all beginner artist",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: GoogleFonts.ibmPlexSans(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                ButtonText(
                                    text: data.publisherData!.name.toString(),
                                    //  "Samule Doe",
                                    color: Colors.black45),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.009),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.black45,
                                      size: 15,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01),
                                    SmallText(
                                        text: "${data.students} student",
                                        color: Colors.black45),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    Icon(
                                      Icons.star,
                                      color: const Color(0xff4873a6)
                                          .withOpacity(0.7),
                                      size: 15,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    SmallText(
                                        text: "${data.rating}",
                                        color: Colors.black45),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      });
}

Widget Following(context) {
  return Column(
    children: [
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/profile-pic.jpg'),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonText(
                              text: "Sammuel jonass", color: Colors.black),
                          SmallText(text: "@jdoe", color: Colors.black45)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: SmallText(text: "Follow", color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
