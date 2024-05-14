// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/common/presentation/view/base_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/system_util.dart';

import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/main_title.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/widget/social_auth_button.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen_layout.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/event/social_auth_screen_event.dart';
import 'package:gamemuncheol/feature/auth/view/social_auth_screen/hook/use_video_player_controller.dart';

class SocialAuthScreen extends BaseScreen
    with SystemUtil, SocialAuthScreenEvent {
  SocialAuthScreen({super.key});

  static const path = "/auth";
  static const name = "SocialAuthScreen";

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final videoPlayerController =
        useVideoPlayerController(assetPath: AppAsset.authBackgroundVideo);

    useEffect(() {
      portraitUp();
      return () {};
    }, []);

    return SocialAuthScreenLayout(
      backgroundVideo: buildBackgroundVideo(videoPlayerController),
      mainTitle: buildMainTitle(),
      appleSignInButton: buildAppleSignInButton(
        signInWithApple: () {
          signInWithOAuth(signInMethod: SignInMethod.apple);
        },
      ),
      googleSignInButton: buildGoogleSignInButton(
        signInWithGoogle: () {
          signInWithOAuth(signInMethod: SignInMethod.google);
        },
      ),
    );
  }

  Widget buildBackgroundVideo(VideoPlayerController videoPlayerController) {
    return AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: VideoPlayer(videoPlayerController),
    );
  }

  Widget buildMainTitle() => const MainTitle();

  Widget buildAppleSignInButton({required VoidCallback signInWithApple}) {
    return SocialAuthButton.apple(onTap: signInWithApple);
  }

  Widget buildGoogleSignInButton({required VoidCallback signInWithGoogle}) {
    return SocialAuthButton.google(onTap: signInWithGoogle);
  }
}
