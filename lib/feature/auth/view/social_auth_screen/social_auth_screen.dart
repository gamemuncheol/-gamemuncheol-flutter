// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/feature/auth/view/social_auth_screen/social_auth_screen_scaffold.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/feature/auth/widget/social_auth_button.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';

class SocialAuthScreen extends StatefulWidget {
  const SocialAuthScreen({
    super.key,
  });

  static const PATH = "/";
  static const ROUTE_NAME = "SocialAuthScreen";

  @override
  State<SocialAuthScreen> createState() => _SocialAuthScreenState();
}

class _SocialAuthScreenState extends State<SocialAuthScreen> {
  late final VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    controller = VideoPlayerController.asset(
      AssetPaths.AUTH_BACKGROUND_VIDEO_PATH,
    );

    controller.initialize().then((value) {
      controller.setLooping(
        true,
      );

      controller.play();
    });
  }

  @override
  void dispose() {
    controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SocialAuthScreenScaffold(
      backgroundVideo: renderBackgroundVideo(),
      mainObject: renderMainObject(),
      socialLoginButton: renderSocialLoginButton(),
    );
  }

  Widget renderBackgroundVideo() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(
        controller,
      ),
    );
  }

  Widget renderMainObject() {
    const double space1 = 148;

    return Column(
      children: [
        const SizedBox(
          height: space1,
        ).su(),
        const _MainObject(),
      ],
    );
  }

  Widget renderSocialLoginButton() {
    const double topPadding = 148;
    const double bottomPadding = 74;
    const double frameWidth = 358;
    const double frameHeight = 128;

    return Padding(
      padding: const EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ).su(),
      child: SizedBox(
        width: frameWidth,
        height: frameHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialAuthButton.apple(),
            SocialAuthButton.google(),
          ],
        ),
      ).su(),
    );
  }
}

class _MainObject extends StatelessWidget {
  const _MainObject();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        renderStackBaseFrame(),
        renderGradientUnderline(),
        renderWelcomeText(),
        renderLolMunCheol(),
      ],
    );
  }

  Widget renderStackBaseFrame() {
    const double frameWidth = 390;
    const double frameHeight = 280;

    return Center(
      child: const SizedBox(
        width: frameWidth,
        height: frameHeight,
      ).su(),
    );
  }

  Container renderGradientUnderline() {
    const double leftMargin = 45;
    const double topMargin = 142;
    const double frameWidth = 300;

    return Container(
      margin: const EdgeInsets.only(
        left: leftMargin,
        top: topMargin,
      ).su(),
      child: SvgPicture.asset(
        fit: BoxFit.fitWidth,
        AssetPaths.LOL_MUNCHEOL_UNDERLINE_PATH,
      ),
    ).su(
      width: frameWidth,
    );
  }

  Widget renderWelcomeText() {
    const double topPadding = 200;
    const double space1 = 20;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: topPadding,
        ).su(),
        child: Column(
          children: [
            const AppText(
              "정치질과 입롤에 지칠 때는\n112말고, 롤문철",
              color: ColorGuidance.PRIMARY_WITHE,
              size: 24,
              weight: FontWeight.w700,
              align: TextAlign.center,
            ),
            const SizedBox(
              height: space1,
            ).su(),
            const AppText(
              "3초 가입으로 바로 시작하세요.",
              color: ColorGuidance.PRIMARY_WITHE,
              size: 18,
              weight: FontWeight.w500,
              align: TextAlign.center,
            )
          ],
        ),
      ).su(),
    );
  }

  Positioned renderLolMunCheol() {
    const double frameHeight = 191;

    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: frameHeight,
          child: Image.asset(
            AssetPaths.LOL_MUNCHEOL_PATH,
          ),
        ).su(),
      ),
    );
  }
}
