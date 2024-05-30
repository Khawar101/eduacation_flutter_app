// ignore_for_file: prefer_adjacent_string_concatenation
import 'package:education/ui/views/buttom_bar/lessons_screen/marketing/marketing_widgets/rating_Builder.dart';
import '../../../../widgets/common/video_player/video_player.dart';
import '../../../../../services/Model/CoursesModel.dart';
import '../../../../widgets/introBuilder.dart';
import '../../../../widgets/app_utils.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'marketing_viewmodel.dart';

class MarketingView extends StatefulWidget {
  final CoursesModel data;

  const MarketingView({super.key, required this.data});

  @override
  State<MarketingView> createState() => _MarketingViewState();
}

class _MarketingViewState extends State<MarketingView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<MarketingViewModel>.reactive(
      viewModelBuilder: () => MarketingViewModel(),
      builder: (BuildContext context, viewModel, Widget? child) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return WillPopScope(
              onWillPop: () async =>
                  orientation == Orientation.portrait ? true : false,
              child: Scaffold(
                appBar: orientation == Orientation.portrait
                    ? AppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        leading: GestureDetector(
                          onTap: () {
                            viewModel.navigateonBack(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black54,
                            size: 18,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 18,
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                ),
                                const SizedBox(width: 3),
                                CustomText(
                                    text: "English",
                                    textAlign: TextAlign.center,
                                    fontSize: 15,
                                    color: const Color(0xff4873a6)
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w600),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color:
                                      const Color(0xff4873a6).withOpacity(0.7),
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
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
                          ])
                    : null,
                body: SingleChildScrollView(
                  physics: orientation == Orientation.landscape
                      ? const NeverScrollableScrollPhysics()
                      : const ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (orientation == Orientation.landscape) ...[
                            Container()
                          ] else ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.02),
                              child: Column(
                                children: [
                                  BigText(
                                    text: widget.data.title ?? "",
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: height * 0.017),
                                  ReadMoreText(
                                    widget.data.description ?? "",
                                    trimLines: 2,
                                    trimLength: 80,
                                    style:
                                        const TextStyle(color: Colors.black45),
                                    colorClickableText: Colors.black,
                                    trimMode: TrimMode.Length,
                                    trimCollapsedText: 'Read More',
                                    moreStyle: const TextStyle(
                                        color: Color(0xff4873a6),
                                        fontWeight: FontWeight.w500),
                                    trimExpandedText: 'Show Less',
                                    lessStyle: const TextStyle(
                                        color: Color(0xff4873a6),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Row(
                                    children: [
                                      CustomText(
                                          text: widget.data.chapter ??
                                              "0" + " " + "Chapters",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1),
                                      CustomText(
                                          text: "Full ${widget.data.duration!}",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.018),
                                  introBuilder(widget.data),
                                ],
                              ),
                            )
                          ],
                          videoPlayer(
                            url: widget.data.lecture![0].videoUrl!,
                            orientation: orientation,
                            completeVideo: () {},
                          ),
                          SizedBox(height: height * 0.025),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Column(
                              children: [
                                const SmallText(
                                    text:
                                        'You can buy the full course.You have been subscribe to this app for 1 year.',
                                    color: Colors.black45),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF4873A6)
                                            .withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: ButtonText(
                                            text: 'upgrade',
                                            color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xff4873a6)
                                            .withOpacity(0.2),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025,
                                        vertical: height * 0.025),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.play_circle_outlined,
                                              size: 26,
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const ButtonText(
                                                    text:
                                                        'Welcome to the Course',
                                                    color: Colors.black),
                                                const SizedBox(height: 4),
                                                CustomText(
                                                    text: '56 Minutes',
                                                    fontSize: 12,
                                                    color: Colors.black26,
                                                    fontWeight: FontWeight.w500)
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        SizedBox(
                                          //  height: 400,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  widget.data.lecture!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                Lecture lecture =
                                                    widget.data.lecture![index];
                                                return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(children: [
                                                            Container(
                                                              height: 22,
                                                              width: 22,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1),
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        3.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/icons/lock-24.png',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 16),
                                                            SizedBox(
                                                                width:
                                                                    width * .5,
                                                                child: CustomText(
                                                                    text: lecture
                                                                        .title!,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500))
                                                          ]),
                                                          Row(children: [
                                                            CustomText(
                                                                text:
                                                                    "${lecture.duration ?? 0}",
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black26,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)
                                                          ])
                                                        ]));
                                              }),
                                        ),
                                        // SizedBox(
                                        //     height: MediaQuery.of(context)
                                        //             .size
                                        //             .height *
                                        //         0.03),
                                        // Container(
                                        //     height: 30,
                                        //     width: 150,
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //       color: const Color(0xFF4873A6)
                                        //           .withOpacity(0.7),
                                        //     ),
                                        //     child: const Center(
                                        //         child: ButtonText(
                                        //             text: 'See all Lessons',
                                        //             color: Colors.white))),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.00,
                                      vertical: 8),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: BigText(
                                            text: "Rating",
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8),
                                      ratingBuilder(widget.data),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.buyCourse(widget.data);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.02),
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color(0xFF4873A6).withOpacity(0.7),
                                ),
                                child: const Center(
                                    child: ButtonText(
                                        text: 'Unlock All Videos',
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
