import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CoursesTab extends ViewModelWidget<StudentInformationViewModel> {
  const CoursesTab({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StudentInformationViewModel viewModel,
  ) {
    return StreamBuilder<List<CoursesModel>>(
        stream: viewModel.coursesService.coursesStream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CoursesModel>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 106),
              child: CircularProgressIndicator(),
            )
                // Loading(100)
                );
          }
          return Column(
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.userInfo.buyCourses!.length,
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
                              height: 80,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.title.toString(),
                                    // "Adobe illustrator for all beginner artist",
                                    softWrap: true,
                                    maxLines: 1,
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  ButtonText(
                                      text: data.publisherData!.name.toString(),
                                      //  "Samule Doe",
                                      color: Colors.black45),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.009),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.black45,
                                        size: 15,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      SmallText(
                                          text: "${data.students} student",
                                          color: Colors.black45),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      Icon(
                                        Icons.star,
                                        color: const Color(0xff4873a6)
                                            .withOpacity(0.7),
                                        size: 15,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
}
