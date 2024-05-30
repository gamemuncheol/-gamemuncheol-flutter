// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/component/main_title.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/component/social_auth_button.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/event/social_auth_screen_event.dart';
import 'package:gamemuncheol/feature/auth/presentation/view/social_auth/social_auth_screen_layout.dart';

class SocialAuthScreenV2 extends BaseScreenV2 {
  const SocialAuthScreenV2({super.key});

  static const PATH = "/$NAME";
  static const NAME = "SOCIAL_AUTH_SCREEN";

  @override
  BaseScreenV2State<SocialAuthScreenV2> createState() =>
      _SocialAuthScreenV2State();
}

class _SocialAuthScreenV2State extends BaseScreenV2State<SocialAuthScreenV2>
    with DefaultLayout, SocialAuthScreenState {
  @override
  Widget buildBody() {
    return SocialAuthScreenLayout(
      backgroundVideo: buildBackgroundVideo(),
      mainTitle: buildMainTitle(),
      appleSignInBtn: buildAppleSignInBtn(),
      googleSignInBtn: buildGoogleSignInBtn(),
    );
  }

  Widget buildBackgroundVideo() {
    return VideoPlayer(controller);
  }

  Widget buildMainTitle() {
    return const MainTitle();
  }

  Widget buildAppleSignInBtn() {
    return SocialAuthButton.apple(
      onTap: () {
        signIn(signInMethod: SignInMethod.apple);
      },
    );
  }

  Widget buildGoogleSignInBtn() {
    return SocialAuthButton.google(
      onTap: () {
        signIn(signInMethod: SignInMethod.google);
      },
    );
  }
}
