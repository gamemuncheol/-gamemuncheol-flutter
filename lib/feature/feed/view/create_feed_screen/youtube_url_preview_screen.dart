// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeUrlPreviewScreen extends StatelessWidget {
  final YoutubePlayerController playerController;

  const YoutubeUrlPreviewScreen({
    super.key,
    required this.playerController,
  });

  static const PATH = "/youtube_url_preview_screen";
  static const ROUTE_NAME = "YoutubeUrlPreviewScreen";

  factory YoutubeUrlPreviewScreen.fromExtraData(ExtraData extraData) {
    return YoutubeUrlPreviewScreen(
        playerController: extraData.data["playerController"]);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: playerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: context.colorTheme.primaryBlue,
        progressColors: ProgressBarColors(
          playedColor: context.colorTheme.primaryBlue,
          handleColor: context.colorTheme.primaryBlue,
        ),
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
            //some other widgets
          ],
        );
      },
    );
  }
}
