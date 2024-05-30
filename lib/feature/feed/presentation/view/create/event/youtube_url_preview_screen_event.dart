import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/youtube_url_preview_screen.dart';

mixin YoutubeUrlPreviewScreenState
    on BaseScreenV2State<YoutubeUrlPreviewScreen> {
  late final YoutubePlayerController playerController = widget.playerController
    ..addListener(playerListener);

  final ValueNotifier<bool> showAppBar = ValueNotifier(true);

  onLeadingTap() {
    context.pop();
  }

  void onEnded(YoutubeMetaData? metaData) {
    portraitUp();
  }

  void _hideAppBar() {
    showAppBar.value = false;
  }

  void _showAppBar() {
    showAppBar.value = true;
  }

  void playerListener() {
    if (playerController.value.isFullScreen) {
      _hideAppBar();
    } else if (!playerController.value.isFullScreen) {
      _showAppBar();
    }
  }

  @override
  void dispose() {
    playerController.removeListener(playerListener);
    playerController.dispose();
    super.dispose();
  }
}
