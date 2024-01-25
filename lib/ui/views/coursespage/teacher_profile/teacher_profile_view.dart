import 'package:education/ui/views/coursespage/teacher_profile/teacher_profile_viewmodel.dart';
import 'package:education/ui/views/coursespage/teacher_profile/widgets/teacher_info.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../services/Model/CoursesModel.dart';

class TeacherProfileView extends StackedView<TeacherProfileViewModel> {
  final CoursesModel courseData;
  const TeacherProfileView(this.courseData, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                  size: 18,
                ),
                onPressed: () {
                  viewModel.navigateToBackScreen();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: CustomText(
              text: "Teacher Info",
              textAlign: TextAlign.center,
              fontSize: 18,
              color: const Color(0xff4873a6).withOpacity(0.7),
              fontWeight: FontWeight.w600),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.share_outlined,
                color: Colors.black54,
                size: 20,
              ),
            )
          ]),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Column(
                  children: [
                    TeacherInfo(courseData),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  TeacherProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherProfileViewModel();

  @override
  void onViewModelReady(TeacherProfileViewModel viewModel) {
    viewModel.getUserData(courseData.uID);
    super.onViewModelReady(viewModel);
  }
}
