import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

ChewieController useChewieController({
  required VideoPlayerController videoPlayerController,
}) {
  return use(
    _ChewiePlayerController(videoPlayerController: videoPlayerController),
  );
}

class _ChewiePlayerController extends Hook<ChewieController> {
  final VideoPlayerController videoPlayerController;
  const _ChewiePlayerController({required this.videoPlayerController});

  @override
  ChewiePlayerControllerState createState() =>
      ChewiePlayerControllerState(videoPlayerController: videoPlayerController);
}

class ChewiePlayerControllerState
    extends HookState<ChewieController, _ChewiePlayerController> {
  final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  ChewiePlayerControllerState({required this.videoPlayerController});

  @override
  void initHook() {
    super.initHook();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 16/9,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
    );
  }

  @override
  ChewieController build(BuildContext context) {
    return chewieController;
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
