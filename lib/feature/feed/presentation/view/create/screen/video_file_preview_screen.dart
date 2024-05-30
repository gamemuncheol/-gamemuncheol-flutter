// ignore_for_file: constant_identifier_names

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/video_file_preview_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/video_file_preview_screen_layout.dart';

class VideoFilePreviewScreenV2 extends BaseScreenV2 {
  final VideoPlayerController videoPlayerController;

  const VideoFilePreviewScreenV2(
      {super.key, required this.videoPlayerController});

  static const PATH = "/$NAME";
  static const NAME = "VIDEO_FILE_PREVIEW_SCREEN";

  factory VideoFilePreviewScreenV2.fromExtraData(ExtraData extraData) {
    final Map<String, dynamic> data = extraData.data;
    return VideoFilePreviewScreenV2(
      videoPlayerController: data["videoPlayerController"],
    );
  }

  @override
  BaseScreenV2State<VideoFilePreviewScreenV2> createState() =>
      _VideoFilePreviewScreenV2State();
}

class _VideoFilePreviewScreenV2State
    extends BaseScreenV2State<VideoFilePreviewScreenV2>
    with DefaultLayout, VideoFilePreViewState {
  @override
  Widget buildBody() {
    return VideoFilePreviewScreenLayout(
      popButton: buildPopButton(),
      backgrondArea: buildBackgroundArea(),
      player: buildPlayer(),
    );
  }

  Widget buildPopButton() {
    const String iconPath = AppAsset.CHEVRON_LEFT_WHITE;

    final double leftPadding = 16.w;
    final double topPadding = 16.h;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(leftPadding, topPadding, 0, 0),
        child: GestureDetector(
          onTap: context.pop,
          child: SvgPicture.asset(
            iconPath,
          ),
        ),
      ),
    );
  }

  Widget buildBackgroundArea() {
    return Container(
      color: colorTheme.black,
    );
  }

  Widget buildPlayer() {
    final Chewie chewie = Chewie(
      controller: chewieController,
    );

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: chewie,
    );
  }
}
