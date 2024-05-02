// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/mixin/social_auth_screen_event.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen_scaffold.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/system_util.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/social_auth_button.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/hook/use_video_player_controller.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/lol_muncheol_logo.dart';

class SocialAuthScreen extends HookConsumerWidget
    with SystemUtil, SocialAuthScreenEvent {
  const SocialAuthScreen({super.key});

  static const PATH = "/social_auth_screen";
  static const ROUTE_NAME = "SocialAuthScreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VideoPlayerController videoPlayerController =
        useVideoPlayerController(
      assetPath: AppAsset.AUTH_BACKGROUND_VIDEO_PATH,
    );

    useEffect(() {
      portraitUp();
      return resetSetting;
    }, []);

    return SocialAuthScreenScaffold(
      backgroundVideo: renderBackgroundVideo(videoPlayerController),
      logoWithPropaganda: renderLogoWithPropaganda(),
      socialLoginButtons: renderSocialLoginButtons(
        signInWithApple: () {
          signInWhen(context, ref, signInMethod: SignInMethod.apple);
        },
        signInWithGoogle: () {
          signInWhen(context, ref, signInMethod: SignInMethod.google);
        },
      ),
    );
  }

  Widget renderBackgroundVideo(VideoPlayerController videoPlayerController) {
    return AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: VideoPlayer(videoPlayerController),
    );
  }

  Widget renderLogoWithPropaganda() => const LogoWithPropaganda();

  Widget renderSocialLoginButtons({
    required VoidCallback signInWithApple,
    required VoidCallback signInWithGoogle,
  }) {
    return Column(
      children: [
        SocialAuthButton.apple(onTap: signInWithApple),
        const Gap(26).setHeight(),
        SocialAuthButton.google(onTap: signInWithGoogle),
      ],
    );
  }
}
