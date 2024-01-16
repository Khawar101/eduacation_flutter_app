import 'package:education/ui/common/ui_helpers.dart';
import 'package:education/ui/views/coursespage/coursedetail/video_player.dart';
import 'package:education/ui/views/coursespage/coursedetail/widgets/courseintro.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../services/Model/CoursesModel.dart';
import '../../../../services/Model/reportModel.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/app_utils.dart';
import '../../../widgets/introBuilder.dart';
import 'coursedetail_viewmodel.dart';
import 'widgets/tapBar/contantTab.dart';
import 'widgets/tapBar/overviewdart.dart';

class CoursedetailView extends StackedView<CoursedetailViewModel> {
  final CoursesModel courseData;
  const CoursedetailView(this.courseData, {Key? key}) : super(key: key);
  @override
  void onViewModelReady(CoursedetailViewModel viewModel) {
    viewModel.initializePlay(courseData.lecture![0].videoUrl);
    viewModel.showProject(courseData.publishDate);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CoursedetailViewModel viewModel) {
    viewModel.controller!.dispose();
    viewModel.setAllOrientations();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CoursedetailViewModel viewModel,
    Widget? child,
  ) {
    final width = MediaQuery.of(context).size.width;
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
                title: CustomText(
                    text: "Details",
                    textAlign: TextAlign.center,
                    fontSize: 18,
                    color: const Color(0xff4873a6).withOpacity(0.7),
                    fontWeight: FontWeight.w600),
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
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading(50);
                  }
                  if (snapshot.hasData) {
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
                              videoComplete: true,
                              orientation: orientation,
                              runOnComplete: () {
                                viewModel.updateLecture(courseData, _reportData,
                                    _complete, _videoUrl);
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  introBuilder(courseData),
                                  const SizedBox(height: 5),
                                  courseintro(context, courseData),
                                  verticalSpace(6),
                                  InkWell(
                                    onTap: () {
                                      viewModel.joinGroup(courseData);
                                    },
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ButtonText(
                                            text: "Join Group",
                                            color: Colors.black),
                                        horizontalSpaceTiny,
                                        Icon(Icons.chat_outlined, size: 14)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          viewModel.tabPageChange(0);
                                        },
                                        child: Column(
                                          children: [
                                            CustomText(
                                                text: 'Overview',
                                                fontSize: 16.0,
                                                color: viewModel.tabPage == 0
                                                    ? Colors.black
                                                    : const Color(0xff4873a6)
                                                        .withOpacity(0.7),
                                                fontWeight: FontWeight.w600),
                                            viewModel.tabPage == 0
                                                ? Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    color:
                                                        const Color(0xff4873a6)
                                                            .withOpacity(0.7),
                                                    height: 2,
                                                    width: width * 0.35)
                                                : Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                  )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          viewModel.tabPageChange(1);
                                        },
                                        child: Column(
                                          children: [
                                            CustomText(
                                                text: 'Contant',
                                                fontSize: 16.0,
                                                color: viewModel.tabPage == 0
                                                    ? const Color(0xff4873a6)
                                                        .withOpacity(0.7)
                                                    : Colors.black,
                                                fontWeight: FontWeight.w600),
                                            viewModel.tabPage == 1
                                                ? Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    color:
                                                        const Color(0xff4873a6)
                                                            .withOpacity(0.7),
                                                    height: 2,
                                                    width: width * 0.35)
                                                : Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  viewModel.tabPage == 0
                                      ? Overview(
                                          courseData,
                                        )
                                      : Contant(courseData, _reportData)
                                ],
                              ),
                            ),
                          ])),
                        ),
                      ],
                    );
                  }
                  return Loading(50);
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
