import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_file_preview_screen.dart';

mixin VideoFilePreViewState on BaseScreenV2State<VideoFilePreviewScreenV2> {
  late ChewieController chewieController = ChewieController(
    videoPlayerController: widget.videoPlayerController,
    autoPlay: true,
    looping: false,
    deviceOrientationsAfterFullScreen: [
      DeviceOrientation.portraitUp,
    ],
  );

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
