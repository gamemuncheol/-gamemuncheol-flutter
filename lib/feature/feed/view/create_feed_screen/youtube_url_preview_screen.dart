// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/presentation/layout/default_layout.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/event/youtube_url_preview_screen_event.dart';

abstract class YoutubeUrlPreviewScreenScaffold extends StatelessWidget {
  final YoutubePlayerController playerController;

  const YoutubeUrlPreviewScreenScaffold({
    super.key,
    required this.playerController,
  });

  Widget buildBackgroundArea();
  Widget buildPopButton();
  Widget buildPlayer(Widget player);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: YoutubePlayerBuilder(
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
          return Stack(
            children: [
              buildBackgroundArea(),
              buildPopButton(),
              buildPlayer(player),
            ],
          );
        },
      ),
    );
  }
}

class YoutubeUrlPreviewScreen extends YoutubeUrlPreviewScreenScaffold
    with YoutubeUrlPreviewScreenEvent {
  YoutubeUrlPreviewScreen({super.key, required super.playerController});

  static const PATH = "/youtube_url_preview_screen";
  static const ROUTE_NAME = "YoutubeUrlPreviewScreen";

  factory YoutubeUrlPreviewScreen.fromExtraData(ExtraData extraData) {
    final Map<String, dynamic> data = extraData.data;
    return YoutubeUrlPreviewScreen(playerController: data["playerController"]);
  }

  @override
  Widget buildPopButton() {
    return Builder(
      builder: (context) {
        const double iconSize = 42;

        return Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: IconButton(
              onPressed: () => pop(context),
              icon: Icon(
                Icons.chevron_left,
                size: iconSize,
                color: context.colorTheme.background,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildBackgroundArea() {
    return Builder(
      builder: (context) {
        return Container(color: context.colorTheme.black);
      },
    );
  }

  @override
  Widget buildPlayer(Widget player) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(child: player),
      ],
    );
  }
}
