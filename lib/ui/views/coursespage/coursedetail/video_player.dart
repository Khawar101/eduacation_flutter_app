// ignore_for_file: camel_case_types
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'coursedetail_viewmodel.dart';

class videoPlayer extends ViewModelWidget<CoursedetailViewModel> {
  final String url;
  final Orientation orientation;
  final Function completeVideo;

  const videoPlayer(
      {super.key,
      required this.url,
      required this.orientation,
      required this.completeVideo});

  @override
  Widget build(
    BuildContext context,
    CoursedetailViewModel viewModel,
  ) {
    return viewModel.replyVideo
        ? SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.height
                : 240,
            width: MediaQuery.of(context).size.width,
            child: viewModel.controller!.value.isInitialized
                ? Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.height
                          : 240,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(fit: StackFit.expand, children: [
                        AspectRatio(
                            aspectRatio:
                                viewModel.controller!.value.aspectRatio,
                            child: VideoPlayer(viewModel.controller!)),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: IconButton(
                            onPressed: viewModel.play,
                            icon: Icon(
                                viewModel.controller!.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.black),
                            iconSize: 40,
                          ),
                        ),
                        Positioned(
                          bottom: 17,
                          left: 50,
                          child: ValueListenableBuilder(
                              valueListenable: viewModel.controller!,
                              builder:
                                  (context, VideoPlayerValue value, child) {
                                log(value.position.inMinutes.toString());
                                return Text(
                                  viewModel.videoDuration(value.position),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                );
                              }),
                        ),
                        Positioned(
                          bottom: 23,
                          left: 100,
                          height: 7,
                          width: orientation == Orientation.portrait
                              ? MediaQuery.of(context).size.width * .5
                              : MediaQuery.of(context).size.width * .76,
                          child: VideoProgressIndicator(
                            colors: const VideoProgressColors(
                                backgroundColor: Colors.grey,
                                playedColor: Colors.black),
                            viewModel.controller!,
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                          ),
                        ),
                        Positioned(
                          bottom: 17,
                          right: 50,
                          child: Text(
                            viewModel.videoDuration(
                                viewModel.controller!.value.duration),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              viewModel.setLandScape(context);
                            },
                            icon: const Icon(Icons.fullscreen_exit,
                                color: Colors.black),
                            iconSize: 40,
                          ),
                        ),
                      ]),
                    ),
                  ])
                : const Center(child: CircularProgressIndicator()))

        // } else {
        : const Center(child: CircularProgressIndicator());
    // }
    // });
  }
}
