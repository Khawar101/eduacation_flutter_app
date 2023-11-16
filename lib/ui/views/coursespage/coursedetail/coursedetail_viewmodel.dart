// import 'package:education/services/login_service.dart';
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, recursive_getters, deprecated_member_use
import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/app/app.router.dart';
import 'package:education/services/Model/CoursesModel.dart';
import 'package:education/services/Model/chat_member.dart';
import 'package:education/services/Model/userData.dart';
import 'package:education/services/courses_service.dart';
import 'package:education/services/login_service.dart';
import 'package:education/services/subscription_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/rating_service.dart';
import 'widgets/ratingNow.dart';

class CoursedetailViewModel extends BaseViewModel {
  final _loginService = locator<LoginService>();
  final _navigationService = locator<NavigationService>();
  final _courseService = locator<CoursesService>();
  final ratingService = locator<RatingService>();
  final subscriptionService = locator<SubscriptionService>();

  TextEditingController reviewCtrl = TextEditingController();
  var rating;
  var videoUrl;
  var videoComplete = false;

  List<StudentProjects> get projectData => _courseService.projectData;

  updateVideo(_videoUrl, _complete) async {
    videoUrl = _videoUrl;
    startVideoPlayer(_videoUrl);
    setVideeComplete(_complete);
    notifyListeners();
  }

  userData get user => _loginService.UserData;

  navigateAddProjectView(courseData) {
    _navigationService.navigateToAddprojectView(courseData: courseData);
  }

  navigateToPosterView(courseData) {
    _navigationService.navigateToPosterView(projectData: courseData);
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

  Color _indicatorColor = const Color(0xff4873a6).withOpacity(0.7);
  Color _labelColor = Colors.black;

  Color get indicatorColor => _indicatorColor;
  Color get labelColor => _labelColor;

  void changeTabColors(Color indicatorColor, Color labelColor) {
    _indicatorColor = indicatorColor;
    _labelColor = labelColor;
    notifyListeners(); // Notify the view that data has changed and rebuild the widget
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  joinGroup(CoursesModel courseData) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>?> snapshot = await firestore
          .collection("chatRoom")
          .doc(courseData.publishDate)
          .get();

      ChatMember _chatMember =
          ChatMember.fromJson(snapshot.data() as Map<String, dynamic>);
      var contain = _chatMember.member!
          .where((element) => element.uID == _loginService.UserData.uID);
      if (contain.isEmpty) {
        Member cruntUser = Member(
            name: _loginService.UserData.username,
            uID: _loginService.UserData.uID,
            profile: _loginService.UserData.profile);
        _chatMember.member!.add(cruntUser);
        Map<String, dynamic> messageData = {
          "SMS": "${_loginService.UserData.username} joined group",
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "notification",
          "UID": _loginService.UserData.uID,
        };
        _chatMember.membersUid?.add(_loginService.UserData.uID.toString());

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection("chatRoom")
            .doc(courseData.publishDate)
            .update({
          "member": _chatMember.member!.map((e) => e.toJson()),
          "membersUid": _chatMember.membersUid,
          "lastMessage": messageData
        });

        await firestore
            .collection("chatRoom")
            .doc(courseData.publishDate)
            .collection('chats')
            .doc()
            .set(messageData);
        notifyListeners();
      } else {
        log("Already Joined");
      }
    } catch (e) {
      log("Error: ${e.toString()}");
    }
  }

  // project data add and show

  // Future<List<CoursesModel>> showProject(courseKey, uID) async {
  //   try {
  //    var querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection("courses")
  //             .doc(courseKey)
  //             .collection('projectData')
  //             .where('uid', isEqualTo: uID)
  //             .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       log("=======>${querySnapshot}");
  //       querySnapshot.docs.forEach((doc) {
  //         log("Project Data: ${doc.data()}");
  //       });
  //     } else {
  //       log("No project data found for uID: $uID in course: $courseKey");
  //     }
  //   } catch (e) {
  //     log("======upload data===$e");
  //   }
  //   return [];
  // }

  // Future<void> showProject(courseKey) async {
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await FirebaseFirestore.instance
  //             .collection("courses")
  //             .doc(courseKey)
  //             .collection('projectData')
  //             .where('uid', isEqualTo: _loginService.UserData.uID)
  //             .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       projectData = querySnapshot.docs
  //           .map((doc) => StudentProjects.fromJson(doc.data()))
  //           .toList();

  //       log("Project Data: $projectData");
  //     } else {
  //       log("No project data found for uID: ${_loginService.UserData.uID} in course: $courseKey");
  //     }
  //   } catch (e) {
  //     log("Error while fetching project data: $e");
  //   }
  // }

  void showProject(courseKey) async {
    await _courseService.showProject(courseKey);
    notifyListeners();
  }
}
