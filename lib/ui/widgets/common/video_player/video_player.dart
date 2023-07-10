import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_player_model.dart';

class VideoPlayer extends StackedView<VideoPlayerModel> {
  const VideoPlayer({super.key});

  @override
  Widget builder(
    BuildContext context,
    VideoPlayerModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  VideoPlayerModel viewModelBuilder(
    BuildContext context,
  ) =>
      VideoPlayerModel();
}
