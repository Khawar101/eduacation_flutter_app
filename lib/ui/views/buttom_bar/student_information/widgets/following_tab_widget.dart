import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FollowingTab extends ViewModelWidget<StudentInformationViewModel> {
  const FollowingTab({Key? key}) : super(key: key);

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
          List<CoursesModel>? data = snapshot.data;
          return Column(
            children: [
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.02,
                          top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      data![0].publisherData!.email.toString())
                                  // AssetImage('assets/images/profile-pic.jpg'),
                                  ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtonText(
                                      text: data[0]
                                          .publisherData!
                                          .name
                                          .toString(),
                                      // "Sammuel jonass",
                                      color: Colors.black),
                                  SmallText(
                                      text: "@${data[0].title}",
                                      color: Colors.black45)
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: SmallText(
                                    text: "Follow", color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
