import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';
import 'package:gamemuncheol/feature/auth/provider/privacy_policy_sheet_provider.dart';

class SocialAuthButton extends ConsumerWidget {
  // 플랫폼
  final SignInMethod signInMethod;

  // 플랫폼 로고 주소
  final String imagePath;

  // 버튼 문구
  final String buttonText;

  // 버튼 색상
  final Color buttonColor;

  // 폰트 생상
  final Color fontColor;

  const SocialAuthButton({
    super.key,
    required this.signInMethod,
    required this.imagePath,
    required this.buttonText,
    required this.buttonColor,
    required this.fontColor,
  });

  factory SocialAuthButton.apple() {
    return const SocialAuthButton(
      signInMethod: SignInMethod.APPLE,
      imagePath: AssetPaths.APPLE_LOGO_PATH,
      buttonText: "Apple로 계속하기",
      buttonColor: ColorGuidance.BLACK_800,
      fontColor: ColorGuidance.PRIMARY_WITHE,
    );
  }

  factory SocialAuthButton.google() {
    return const SocialAuthButton(
      signInMethod: SignInMethod.GOOGLE,
      imagePath: AssetPaths.GOOGLE_LOGO_PATH,
      buttonText: "Google로 계속하기",
      buttonColor: ColorGuidance.PRIMARY_WITHE,
      fontColor: ColorGuidance.FONT_DARK_GREY,
    );
  }

  void showPrivatePolicyDocs(
    BuildContext context,
    WidgetRef ref,
  ) async {
    ref
        .read(
          authNotifierProvider.notifier,
        )
        .selectPlatform(
          signInMethod: signInMethod,
        );
        
    ref
        .read(
          privacyPolicyNotifierProvider.notifier,
        )
        .showPrivatePolicyDocs(
          context,
        );
  }

  final double buttonWidth = 358;
  final double buttonHegith = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => showPrivatePolicyDocs(
        context,
        ref,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            54,
          ),
        ),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              renderPlatformLogo(),
              renderText(),
            ],
          ),
        ).su(),
      ).su(
        width: buttonWidth,
        height: buttonHegith,
      ),
    );
  }

  Widget renderPlatformLogo() => SvgPicture.asset(
        imagePath,
      );

  Widget renderText() {
    const double leftPadding = 12;

    return Padding(
      padding: const EdgeInsets.only(
        left: leftPadding,
      ).su(),
      child: AppText(
        buttonText,
        color: fontColor,
        size: 18,
        weight: FontWeight.w700,
      ),
    );
  }
}
