// import 'package:education/services/login_service.dart';
// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:developer';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/subscription_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:video_player/video_player.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/Model/ratingModel.dart';
import '../../../../services/rating_service.dart';
import '../../../../utils/loading.dart';
import '../../../widgets/app_utils.dart';
import 'widgets/ratingNow.dart';

class CoursedetailViewModel extends BaseViewModel {
  // final _loginService = locator<LoginService>();
  final ratingService = locator<RatingService>();
  final subscriptionService = locator<SubscriptionService>();
  // final coursesL = VideoPlayerModel();
  //  TabController tabController=TabController();
  TextEditingController reviewCtrl = TextEditingController();
  var rating;
  var videoUrl;
  var videoComplete = false;
  updateVideo(_videoUrl, _complete) async {
    videoUrl = _videoUrl;
    startVideoPlayer(_videoUrl);
    setVideeComplete(_complete);
    notifyListeners();
  }

  void setVideeComplete(value) {
    videoComplete = value;
    // notifyListeners();
  }

  updateLecture(courseData, reportData, _complete, _videoUrl) {
    if (_complete == false) {
      subscriptionService.updateLecture(courseData, reportData, _videoUrl);
    }
  }

  rateNowAlert(context, courseData, viewModel) {
    ratingNow(context, courseData, viewModel, notifyListeners);
  }

  getRating(value) {
    rating = value;
    notifyListeners();
  }

  postRating(courseData, context) {
    ratingService.rateNow(reviewCtrl, rating, courseData);
    reviewCtrl.clear;
    notifyListeners();
    Navigator.pop(context);
  }

  Widget ratingBuilder(CoursesModel courseData) {
    return StreamBuilder<List<RatingModel>>(
      stream: ratingService.ratingStream(courseData.publishDate),
      builder:
          (BuildContext context, AsyncSnapshot<List<RatingModel>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading(100);
        }
        if (snapshot.data!.isEmpty) {
          return const Center(child: Text("No rating yet..."));
        }
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              RatingModel data = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(data.profile!),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonText(text: data.name!, color: Colors.black),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.builder(
                                    wrapAlignment: WrapAlignment.start,
                                    initialRating: data.rating!,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    ignoreGestures: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    onRatingUpdate: (rating) {
                                      //print(rating);
                                    },
                                  ),
                                  Text(
                                    timeago
                                        .format(data.date!.toDate())
                                        .toString(),
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 12,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReadMoreText(
                      data.review.toString(),
                      trimLines: 2,
                      trimLength: 80,
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                      colorClickableText: Colors.black,
                      trimMode: TrimMode.Length,
                      trimCollapsedText: 'Read more',
                      moreStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      trimExpandedText: '...Show Less',
                      lessStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }

  StreamController<bool> streamController = StreamController();
  bool replyVideo = true;
  VideoPlayerController? controller;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  void initializePlay(url) {
    log("initializePlay");
    controller = VideoPlayerController.network(url)
      ..addListener(() => notifyListeners())
      ..setLooping(false);
    // ..initialize().then((value) => controller!.play());
    startVideoPlayer(url);
  }

  play() {
    controller!.value.isPlaying ? controller!.pause() : controller!.play();
    notifyListeners();
  }

  var tabPage = 1;
  tabPageChange(value) {
    tabPage = value;
    notifyListeners();
  }

  Future<void> startVideoPlayer(url) async {
    print('~=============>$url');
    // streamController.add(true);
    replyVideo = false;
    notifyListeners();
    log("===Flase");
    Future.delayed(const Duration(milliseconds: 1500), () async {
      final VideoPlayerController _controller =
          VideoPlayerController.network(url);

      _controller.addListener(_listener);

      await _controller.setLooping(true);

      await _controller.initialize();

      final VideoPlayerController oldController =
          controller ?? VideoPlayerController.network(url);

      controller = _controller;
      // notifyListeners();
      await _controller.play();
      await oldController.dispose();
      // streamController.add(false);
      replyVideo = true;
      notifyListeners();
      log("===True");
    });
  }

  get _listener => () {
        if (controller != null && controller?.value.size != null) {
          controller?.removeListener(_listener);
        }
      };

  setLandScape(context) async {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  Future setAllOrientations() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}
