import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TabBarNameWidget extends ViewModelWidget<StudentInformationViewModel> {
  const TabBarNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StudentInformationViewModel viewModel,
  ) {
    return TabBar(
      indicatorWeight: 1,
      indicatorPadding: const EdgeInsets.only(bottom: 4),
      indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
      labelStyle:
          GoogleFonts.ibmPlexSans(fontSize: 16.0, fontWeight: FontWeight.w600),
      onTap: viewModel.tabSelect,
      labelColor: Colors.black,
      unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
      tabs: [
        Tab(
            icon: Text(
                viewModel.courseData.studentProjects?.length.toString() ?? ""),
            text: "Project"),
        Tab(
            icon: Text(viewModel.userInfo.buyCourses!.length.toString()),
            text: "Courses"),
        const Tab(icon: Text("23"), text: "Following"),
      ],
    );
  }
}
