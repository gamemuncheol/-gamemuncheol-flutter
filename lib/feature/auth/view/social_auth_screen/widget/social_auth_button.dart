import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gap/gap.dart';

class SocialAuthButton extends ConsumerWidget {
  final String imagePath;
  final String label;
  final Color labelColor;
  final Color buttonColor;
  final VoidCallback onTap;

  const SocialAuthButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.buttonColor,
    required this.labelColor,
    required this.onTap,
  });

  factory SocialAuthButton.apple({required VoidCallback onTap}) {
    return SocialAuthButton(
      onTap: onTap,
      imagePath: AppAsset.APPLE_LOGO_PATH,
      label: "Apple로 계속하기",
      buttonColor: AppColor.NATURAL_06,
      labelColor: AppColor.PRIMARY_WITHE,
    );
  }

  factory SocialAuthButton.google({required VoidCallback onTap}) {
    return SocialAuthButton(
      onTap: onTap,
      imagePath: AppAsset.GOOGLE_LOGO_PATH,
      label: "Google로 계속하기",
      buttonColor: AppColor.PRIMARY_WITHE,
      labelColor: AppColor.FONT_GREY_04,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double buttonWidth = 358;
    const double buttonHegith = 50;

    final BoxDecoration buttonDecoration = BoxDecoration(
      color: buttonColor,
      borderRadius: BorderRadius.circular(54),
    );

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .withSize(
            width: buttonWidth,
            height: buttonHegith,
          )
          .withBoxDecoration(buttonDecoration)
          .withChild(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                renderPlatformLogo(),
                const Gap(12).withWidth(),
                renderText(),
              ],
            ),
          ),
    );
  }

  Widget renderPlatformLogo() => SvgPicture.asset(imagePath);

  Widget renderText() {
    final TextStyle labelStyle = TextStyleBuilder()
        .withColor(labelColor)
        .withFontSize(18)
        .withMedium()
        .build();

    return Text(
      label,
      style: labelStyle,
    );
  }
}
