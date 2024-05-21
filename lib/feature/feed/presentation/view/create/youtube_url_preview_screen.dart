// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/youtube_url_preview_screen_layout.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/youtube_url_preview_screen_event.dart';

class YoutubeUrlPreviewScreen extends BaseScreen
    with YoutubeUrlPreviewScreenEvent {
  final YoutubePlayerController playerController;
  YoutubeUrlPreviewScreen({super.key, required this.playerController});

  static const PATH = "/youtube_url_preview_screen";
  static const NAME = "YoutubeUrlPreviewScreen";

  factory YoutubeUrlPreviewScreen.fromExtraData(ExtraData extraData) {
    final Map<String, dynamic> data = extraData.data;
    return YoutubeUrlPreviewScreen(playerController: data["playerController"]);
  }

  @override
  PreferredSizeWidget? buildAppBar(ref) {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    const String iconPath = AppAsset.chevronLeftWhite;

    return AppBar(
      backgroundColor: colorTheme.black,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(left: leadingPadding),
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: playerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: colorTheme.primaryBlue,
        progressColors: ProgressBarColors(
          playedColor: colorTheme.primaryBlue,
          handleColor: colorTheme.primaryBlue,
        ),
      ),
      builder: (context, player) {
        return YoutubeUrlPreviewScreenLayout(
          backgrondArea: buildBackgroundArea(),
          player: buildPlayer(player),
        );
      },
    );
  }

  Widget buildBackgroundArea() {
    return Container(
      color: colorTheme.black,
    );
  }

  Widget buildPlayer(Widget player) {
    return SizedBox(
      child: player,
    );
  }
}
