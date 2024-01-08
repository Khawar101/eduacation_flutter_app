import 'package:education/ui/views/buttom_bar/student_information/widgets/project_tab_widget.dart';
import 'package:education/ui/views/buttom_bar/student_information/student_information_viewmodel.dart';
import 'package:education/ui/views/buttom_bar/student_information/widgets/courses_tab_widget.dart';
import 'package:education/ui/views/buttom_bar/student_information/widgets/following_Tab_widget.dart';
import 'package:education/ui/views/buttom_bar/student_information/widgets/tabs_name_widget.dart';
import 'package:education/ui/views/buttom_bar/student_information/widgets/user_info.dart';
import 'package:education/ui/views/drawer/drawer_view.dart';
import 'package:education/ui/widgets/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentInformationView extends StackedView<StudentInformationViewModel> {
  const StudentInformationView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, StudentInformationViewModel viewModel,
      Widget? child) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const DrawerView(),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.vertical_distribute_sharp,
                    color: Colors.black54,
                    size: 18,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: CustomText(
                text: "Student Info",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Column(
              children: [
                const UserInfo(),
                const SizedBox(height: 16),
                const TabBarNameWidget(),
                viewModel.currentIndex == 0
                    ? const ProjectTab()
                    : viewModel.currentIndex == 1
                        ? const CoursesTab()
                        : const FollowingTab()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  StudentInformationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentInformationViewModel();
}
