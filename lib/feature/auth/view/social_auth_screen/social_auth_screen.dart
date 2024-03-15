// ignore_for_file: constant_identifier_names

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen_scaffold.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/system_util.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/social_auth_button.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/hook/use_video_player_controller.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/lol_muncheol_logo.dart';

class SocialAuthScreen extends HookWidget with SystemUtil {
  const SocialAuthScreen({
    super.key,
  });

  static const PATH = "/social_auth_screen";
  static const ROUTE_NAME = "SocialAuthScreen";

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      portraitUp();
      return resetSetting;
    });

    final VideoPlayerController videoPlayerController =
        useVideoPlayerController(
      assetPath: AssetPaths.AUTH_BACKGROUND_VIDEO_PATH,
    );

    return SocialAuthScreenScaffold(
      backgroundVideo: renderBackgroundVideo(
        videoPlayerController: videoPlayerController,
      ),
      lolMunCheolLogo: renderLolMuncheolLogo(),
      socialLoginButton: renderSocialLoginButton(),
    );
  }

  Widget renderBackgroundVideo({
    required VideoPlayerController videoPlayerController,
  }) {
    return AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: VideoPlayer(
        videoPlayerController,
      ),
    );
  }

  Widget renderLolMuncheolLogo() {
    const double space1 = 148;

    return Column(
      children: [
        const Gap(
          space1,
        ).withHeight(),
        const LolMuncheolLogo(),
      ],
    );
  }

  Widget renderSocialLoginButton() {
    const double topPadding = 148;
    const double bottomPadding = 74;
    const double frameWidth = 358;
    const double frameHeight = 128;

    return PaddingBuilder()
        .withPadding(
          top: topPadding,
          bottom: bottomPadding,
        )
        .withChild(
          SizedBoxBuilder()
              .withSize(
                width: frameWidth,
                height: frameHeight,
              )
              .withChild(
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialAuthButton.apple(),
                    SocialAuthButton.google(),
                  ],
                ),
              ),
        );
  }
}
