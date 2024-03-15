import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoPlayerController({
  required String assetPath,
}) {
  return use(_VideoPlayerController(
    assetPath: assetPath,
  ));
}

class _VideoPlayerController extends Hook<VideoPlayerController> {
  final String assetPath;
  const _VideoPlayerController({
    required this.assetPath,
  });

  @override
  VideoController createState() => VideoController(
        assetPath: assetPath,
      );
}

class VideoController
    extends HookState<VideoPlayerController, _VideoPlayerController> {
  final String assetPath;
  late VideoPlayerController controller;

  VideoController({
    required this.assetPath,
  });

  @override
  void initHook() {
    super.initHook();
    controller = VideoPlayerController.asset(
      assetPath,
    );

    controller.initialize().then((value) {
      controller.play();
      controller.setLooping(
        true,
      );
    });
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
