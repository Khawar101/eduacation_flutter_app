// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class videoPlayer extends StatefulWidget {
  final String url;
  final Orientation orientation;
  final Function completeVideo;

  const videoPlayer(
      {super.key,
      required this.url,
      required this.orientation,
      required this.completeVideo});

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  VideoPlayerController? controller;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var url = "";
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url)
      ..addListener(() {
        setState(() {
          
        });
        // if (this.mounted) {
        //   log("=====>>");
        //   setState(() {
        //     controller!.play();
        //   });
        // } else {
        //   log("=====>");
        // }
      })
      ..setLooping(false);
    // ..initialize().then((value) => controller!.play());
  }

  setLandScape() async {
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

  @override
  void dispose() {
    super.dispose();
    setAllOrientations();
  }

  @override
  Widget build(BuildContext context) {
    if (url != widget.url) {
      setAllOrientations();
      controller = VideoPlayerController.network(widget.url)
        // ..addListener(() => setState(() {}))
        ..setLooping(false)
        ..initialize().then((value) => controller!.play());
      setState(() {
        url = widget.url;
      });
    }
    return SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height
            : 240,
        width: MediaQuery.of(context).size.width,
        child: controller!.value.isInitialized
            ? Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.height
                      : 240,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(fit: StackFit.expand, children: [
                    AspectRatio(
                        aspectRatio: controller!.value.aspectRatio,
                        child: VideoPlayer(controller!)),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () => controller!.value.isPlaying
                            ? controller!.pause()
                            : controller!.play(),
                        icon: Icon(
                            controller!.value.isPlaying
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
                          valueListenable: controller!,
                          builder: (context, VideoPlayerValue value, child) {
                            return Text(
                              videoDuration(value.position),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 23,
                      left: 100,
                      height: 7,
                      width: widget.orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * .5
                          : MediaQuery.of(context).size.width * .76,
                      child: VideoProgressIndicator(
                        colors: const VideoProgressColors(
                            backgroundColor: Colors.grey,
                            playedColor: Colors.black),
                        controller!,
                        allowScrubbing: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12),
                      ),
                    ),
                    Positioned(
                      bottom: 17,
                      right: 50,
                      child: Text(
                        videoDuration(controller!.value.duration),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setLandScape();
                        },
                        icon: const Icon(Icons.fullscreen_exit,
                            color: Colors.black),
                        iconSize: 40,
                      ),
                    ),
                  ]),
                ),
              ])
            : const Center(child: CircularProgressIndicator()));
  }
}
