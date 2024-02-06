import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/util/screen_utils.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';
import 'package:gamemuncheol/feature/auth/provider/auth_provider.dart';

class SocialAuthButton extends ConsumerWidget {
  final String imagePath;

  final String buttonText;

  final Color buttonColor;

  final Color fontColor;

  final VoidCallback signInFunc;

  const SocialAuthButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.buttonColor,
    required this.fontColor,
    required this.signInFunc,
  });

  void showPrivatePolicyDocs(BuildContext context, WidgetRef ref) {
    ref
        .read(
          authNotifierProvider.notifier,
        )
        .showPrivatePolicyDocs(
          context,
        );
  }

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
          width: 156,
          height: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
              ),
              const SizedBox(
                width: 16,
              ).useScreenUtil(),
              AppText(
                buttonText,
                color: fontColor,
                size: 18,
                weight: FontWeight.w700,
              )
            ],
          ),
        ).useScreenUtil(),
      ).useScreenUtil(
        width: 358,
        height: 50,
      ),
    );
  }
}
