// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/feature/auth/widget/social_auth_button.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
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
    return DefaultLayout(
      child: Stack(
        fit: StackFit.expand,
        children: [
          renderBackgroundVideo(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  renderLolMunCheol(),
                  renderWelcomeText(),
                ],
              ),
              renderSocialLoginButton(),
            ],
          )
        ],
      ),
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

  Widget renderLolMunCheol() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
      ).useScreenUtil(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.PRIMARY_BLUE,
        ),
        child: SvgPicture.asset(
          AssetPaths.LOL_MUNCHEOL_PATH,
        ),
      ).useScreenUtil(
        width: 270,
        height: 133,
      ),
    );
  }

  Widget renderWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 48,
      ).useScreenUtil(),
      child: const Column(
        children: [
          AppText(
            "정치질과 입롤에 지칠 때는\n112말고, 롤문철",
            color: AppColors.PRIMARY_WITHE,
            size: 24,
            weight: FontWeight.w700,
            align: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          AppText(
            "3초 가입으로 바로 시작하세요.",
            color: AppColors.PRIMARY_WITHE,
            size: 18,
            weight: FontWeight.w500,
            align: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget renderSocialLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 74,
      ).useScreenUtil(),
      child: const SizedBox(
        width: 358,
        height: 128,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _AppleSignInButton(),
            _GoogleSignInButton(),
          ],
        ),
      ).useScreenUtil(),
    );
  }
}

class _AppleSignInButton extends ConsumerWidget {
  const _AppleSignInButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialAuthButton(
      signInFunc: () {},
      imagePath: AssetPaths.APPLE_LOGO_PATH,
      buttonText: "Apple로 계속하기",
      buttonColor: AppColors.BLACK_800,
      fontColor: AppColors.PRIMARY_WITHE,
    );
  }
}

class _GoogleSignInButton extends ConsumerWidget {
  const _GoogleSignInButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialAuthButton(
      signInFunc: () {},
      imagePath: AssetPaths.GOOGLE_LOGO_PATH,
      buttonText: "Google로 계속하기",
      buttonColor: AppColors.PRIMARY_WITHE,
      fontColor: AppColors.FONT_DARK_GREY,
    );
  }
}
