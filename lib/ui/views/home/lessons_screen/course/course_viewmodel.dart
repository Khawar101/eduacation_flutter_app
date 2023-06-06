import 'dart:developer';

import 'package:education/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

import '../../../../../app/app.locator.dart';

class CourseViewModel extends BaseViewModel {
  
  // String dataSource =
  //     "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  // late VideoPlayerController controller;
  // bool isPlaying = false;

  // initState() {
  //   controller = VideoPlayerController.network(dataSource)
  //     ..initialize().then((_) {
  //       log("kjghkjhgjk"); // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //     });
  //   //    controller!.play();
  // }

  // videoController() {
  //   isPlaying = !isPlaying;
  //   isPlaying ? controller.play() : controller.pause();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.dispose();
  // }

  final _navigationService = locator<NavigationService>();

  navigateonBack() {
    // log('====>not move');
    _navigationService.back();
  }

  navigateLerners() {
    // log('====>not move');
    _navigationService.navigateToLearnersView();
  }
}
