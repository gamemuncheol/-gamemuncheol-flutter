// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/youtube_url_preview_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/youtube_url_preview_screen_layout.dart';

class YoutubeUrlPreviewScreen extends BaseScreenV2 {
  final YoutubePlayerController playerController;
  const YoutubeUrlPreviewScreen({super.key, required this.playerController});

  static const PATH = "/$NAME";
  static const NAME = "YOUTUBE_URL_PREVIEW_SCREEN";

  factory YoutubeUrlPreviewScreen.fromExtraData(ExtraData extraData) {
    final Map<String, dynamic> data = extraData.data;
    return YoutubeUrlPreviewScreen(
        playerController: data["playerController"]);
  }

  @override
  BaseScreenV2State<YoutubeUrlPreviewScreen> createState() =>
      _YoutubeUrlPreviewScreenV2State();
}

class _YoutubeUrlPreviewScreenV2State
    extends BaseScreenV2State<YoutubeUrlPreviewScreen>
    with DefaultLayout, YoutubeUrlPreviewScreenState {
  @override
  PreferredSizeWidget? buildAppBar() {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    const String iconPath = AppAsset.CHEVRON_LEFT_WHITE;

    return ValueListenableBuilder(
      valueListenable: showAppBar,
      builder: (context, value, child) {
        if (!showAppBar.value) {
          return const SizedBox();
        }

        return AppBar(
          backgroundColor: colorTheme.black,
          leadingWidth: leadingWidth,
          leading: GestureDetector(
            onTap: onLeadingTap,
            child: Padding(
              padding: EdgeInsets.only(
                left: leadingPadding,
              ),
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
          ),
        );
      },
    ).toAppBar();
  }

  @override
  Widget buildBody() {
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
            backgrondArea: _buildBackgroundArea(),
            player: _buildPlayer(
              player,
            ));
      },
    );
  }

  Widget _buildBackgroundArea() {
    return Container(
      color: colorTheme.black,
    );
  }

  Widget _buildPlayer(Widget player) {
    return SizedBox(
      child: player,
    );
  }
}
