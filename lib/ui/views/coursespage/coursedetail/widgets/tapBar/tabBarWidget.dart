import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../services/Model/CoursesModel.dart';
import '../../../../../../services/Model/reportModel.dart';
import '../../coursedetail_viewmodel.dart';


class TabBarWidget extends StatefulWidget {
  final CoursesModel courseData;
  final ReportModel reportData;
  const TabBarWidget(
      {super.key, required this.courseData, required this.reportData});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(_tabSelect);
    super.initState();
  }

  void _tabSelect() {
    setState(() {
      // _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoursedetailViewModel>.reactive(
        viewModelBuilder: () => CoursedetailViewModel(),
        builder: (BuildContext context, CoursedetailViewModel viewModel,
            Widget? child) {
          return Column(
            children: [
              TabBar(
                indicatorWeight: 1,
                indicatorPadding: const EdgeInsets.only(bottom: 4),
                indicatorColor: const Color(0xff4873a6).withOpacity(0.7),
                controller: tabController,
                labelStyle: GoogleFonts.ibmPlexSans(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
                onTap: (value) {
                  viewModel.tabPageChange(value);
                },
                labelColor: Colors.black,
                unselectedLabelColor: const Color(0xff4873a6).withOpacity(0.7),
                tabs: const [
                  Tab(
                    text: 'Overview',
                  ),
                  Tab(
                    text: 'Contant',
                  ),
                ],
              ),
            ],
          );
        });
  }
}
