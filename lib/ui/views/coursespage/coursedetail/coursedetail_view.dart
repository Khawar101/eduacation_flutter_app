import 'dart:developer';
import 'package:education/ui/views/coursespage/coursedetail/widgets/courseintro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/Model/reportModel.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/introBuilder.dart';
import '../../../widgets/video_player.dart';
import 'coursedetail_viewmodel.dart';
import 'widgets/tapBar/contantTab.dart';
import 'widgets/tapBar/overviewdart.dart';

class CoursedetailView extends StatefulWidget {
  final CoursesModel courseData;
  const CoursedetailView({super.key, required this.courseData});

  @override
  State<CoursedetailView> createState() => _CoursedetailViewState();
}

class _CoursedetailViewState extends State<CoursedetailView>
    with TickerProviderStateMixin {
  late TabController tabController;

  // ignore: unused_field
  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(_tabSelect);

    super.initState();
  }

  void _tabSelect() {
    log("Tab index is ${tabController.index}");
    setState(() {
      _currentIndex = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoursedetailViewModel>.reactive(
        viewModelBuilder: () => CoursedetailViewModel(),
        builder: (BuildContext context, CoursedetailViewModel viewModel,
            Widget? child) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return Scaffold(
                  appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black54,
                          size: 18,
                        ),
                      ),
                      title: Text(
                        "Details",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(
                            fontSize: 18,
                            color: const Color(0xff4873a6).withOpacity(0.7),
                            fontWeight: FontWeight.w600),
                      ),
                      centerTitle: true,
                      actions: const [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.bookmark_border_rounded,
                            color: Colors.black54,
                            size: 20,
                          ),
                        )
                      ]),
                  body: SafeArea(
                    child: StreamBuilder(
                      stream: viewModel.subscriptionService
                          .reportStream(widget.courseData.publishDate),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Loading(50);
                        }
                        ReportModel _reportData =
                            ReportModel.fromJson(snapshot.data.data());
                        String _videoUrl = viewModel.videoUrl ??
                            widget.courseData.lecture![0].videoUrl.toString();
                        bool _complete = false;
                        for (var i = 0; i < _reportData.lecture!.length; i++) {
                          if (_videoUrl == _reportData.lecture![i]) {
                            _complete = true;
                          }
                        }
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                videoPlayer(
                                  url: _videoUrl,
                                  orientation: orientation,
                                  completeVideo: () {
                                    viewModel.updateLecture(widget.courseData,
                                        _reportData, _complete, _videoUrl);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      introBuilder(widget.courseData),
                                      courseintro(context, widget.courseData),
                                      const SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                                TabBar(
                                  indicatorWeight: 1,
                                  indicatorPadding:
                                      const EdgeInsets.only(bottom: 4),
                                  indicatorColor:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  controller: tabController,
                                  labelStyle: GoogleFonts.ibmPlexSans(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                  onTap: (value) {},
                                  labelColor: Colors.black,
                                  unselectedLabelColor:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  tabs: const [
                                    Tab(
                                      text: 'Overview',
                                    ),
                                    Tab(
                                      text: 'Contant',
                                    ),
                                  ],
                                ),
                                tabController.index == 0
                                    ? overview(context, widget.courseData)
                                    : contant(context, widget.courseData,
                                        viewModel, _reportData),
                              ])),
                            ),
                          ],
                        );
                      },
                    ),
                  ));
            },
          );
        });
  }
}
