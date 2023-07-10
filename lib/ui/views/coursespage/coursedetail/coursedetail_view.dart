import 'package:education/ui/views/coursespage/coursedetail/widgets/courseintro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/Model/reportModel.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/common/video_player/video_player.dart';
import '../../../widgets/introBuilder.dart';
import 'coursedetail_viewmodel.dart';
import 'widgets/tapBar/tabBarWidget.dart';

class CoursedetailView extends StackedView<CoursedetailViewModel> {
  final CoursesModel courseData;

  const CoursedetailView(this.courseData, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CoursedetailViewModel viewModel,
    Widget? child,
  ) {
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
                    .reportStream(courseData.publishDate),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading(50);
                  }
                  ReportModel _reportData =
                      ReportModel.fromJson(snapshot.data.data());
                  String _videoUrl = viewModel.videoUrl ??
                      courseData.lecture![0].videoUrl.toString();
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
                              viewModel.updateLecture(courseData, _reportData,
                                  _complete, _videoUrl);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                introBuilder(courseData),
                                courseintro(context, courseData),
                                const SizedBox(height: 40),
                                TabBarWidget(
                                    courseData: courseData,
                                    reportData: _reportData)
                              ],
                            ),
                          ),
                        ])),
                      ),
                    ],
                  );
                },
              ),
            ));
      },
    );
  }

  @override
  CoursedetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursedetailViewModel();
}
