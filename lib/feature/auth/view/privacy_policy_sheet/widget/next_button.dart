import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/auth/model/sign_in_method.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_sheet/mixin/next_button_event.dart';

class NextButton extends ConsumerWidget with NextButtonEvent {
  final PageController pageController;
  final SignInMethod signInMethod;
  final int necessaryAcceptCount;

  const NextButton({
    super.key,
    required this.pageController,
    required this.signInMethod,
    required this.necessaryAcceptCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double buttonHeight = 64;

    const BoxDecoration boxDecoration = BoxDecoration(
      color: ColorGuidance.PRIMARY_BLUE,
    );

    final TextStyle textStyle = TextStyleBuilder()
        .withColor(
          ColorGuidance.PRIMARY_WITHE,
        )
        .withFontSize(
          16,
        )
        .withRegular()
        .build();

    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => goNextPage(
            context,
            ref,
            pageController: pageController,
            necessaryAcceptCount: necessaryAcceptCount,
            signInMethod: signInMethod,
          ),
          child: ContainerBuilder()
              .withSize(
                height: buttonHeight,
              )
              .withBoxDecoration(
                boxDecoration,
              )
              .withChild(
                Center(
                  child: Text(
                    "다음",
                    style: textStyle,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
