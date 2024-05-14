// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/video_file_preview_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/feature/feed/hook/use_chewie_controller.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/video_file_preview_screen_scaffold.dart';

import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';

class VideoFilePreviewScreen extends BaseScreen
    with VideoFilePreviewScreenEvent {
  final VideoPlayerController videoPlayerController;

  VideoFilePreviewScreen({super.key, required this.videoPlayerController});

  static const PATH = "/video_file_preview_screen";
  static const ROUTE_NAME = "VideoFilePreviewScreen";

  factory VideoFilePreviewScreen.fromExtraData(ExtraData extraData) {
    final Map<String, dynamic> data = extraData.data;
    return VideoFilePreviewScreen(
      videoPlayerController: data["videoPlayerController"],
    );
  }

  @override
  bool get resizeToAvoidBottomInset => false;

  @override
  AppBar? buildAppBar() => null;

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final ChewieController chewieController =
        useChewieController(videoPlayerController: videoPlayerController);

    return VideoFilePreviewScreenScaffold(
      backgrondArea: buildBackgroundArea(),
      popButton: buildPopButton(onTap: pop),
      player: buildPlayer(chewieController: chewieController),
    );
  }

  Widget buildPopButton({required VoidCallback onTap}) {
    const String iconPath = AppAsset.chevronLeftWhite;

    final double leftPadding = 16.w;
    final double topPadding = 16.h;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(leftPadding, topPadding, 0, 0),
        child: GestureDetector(onTap: onTap, child: SvgPicture.asset(iconPath)),
      ),
    );
  }

  Widget buildBackgroundArea() => Container(color: colorTheme.black);
  Widget buildPlayer({required ChewieController chewieController}) {
    final Chewie chewie = Chewie(controller: chewieController);
    return AspectRatio(aspectRatio: 16 / 9, child: chewie);
  }
}
