import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/privacy_policy_home.dart';
import 'package:gap/gap.dart';

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
      fontColor: ColorGuidance.FONT_GREY_04,
    );
  }

  void showPrivatePolicyDocs(
    BuildContext context,
  ) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => PrivacyPolicyHome(
        signInMethod: signInMethod,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double buttonWidth = 358;
    const double buttonHegith = 50;

    final BoxDecoration buttonDecoration = BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.circular(
        54,
      ),
    );

    return GestureDetector(
      onTap: () => showPrivatePolicyDocs(
        context,
      ),
      child: ContainerBuilder()
          .withSize(
            width: buttonWidth,
            height: buttonHegith,
          )
          .withBoxDecoration(
            buttonDecoration,
          )
          .withChild(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                renderPlatformLogo(),
                const Gap(
                  12,
                ).withWidth(),
                renderText(),
              ],
            ),
          ),
    );
  }

  Widget renderPlatformLogo() => SvgPicture.asset(
        imagePath,
      );

  Widget renderText() {
    final TextStyle textStyle = TextStyleBuilder()
        .withColor(
          fontColor,
        )
        .withFontSize(
          18,
        )
        .withMedium()
        .build();

    return Text(
      buttonText,
      style: textStyle,
    );
  }
}
