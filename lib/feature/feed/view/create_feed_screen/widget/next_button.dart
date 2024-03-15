import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';

class NextButton extends ConsumerWidget {
  final PageController pageController;

  const NextButton({
    super.key,
    required this.pageController,
  });

  void goNextStep({
    required PageController pageController,
  }) {
    const Duration duration = Duration(
      milliseconds: 250,
    );
    Curve curve = Curves.linear;

    pageController.nextPage(
      duration: duration,
      curve: curve,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double buttonHeight = 64;

    final TextStyle textStyle = TextStyleBuilder()
        .withColor(ColorGuidance.PRIMARY_WITHE)
        .withFontSize(20)
        .build();

    final BoxDecoration buttonDecoration = BoxDecoration(
      color: ColorGuidance.PRIMARY_BLUE.withOpacity(0.5),
    );

    return SafeArea(
      top: false,
      bottom: true,
      child: GestureDetector(
        onTap: () => goNextStep(
          pageController: pageController,
        ),
        child: ContainerBuilder()
            .withSize(
              height: buttonHeight,
            )
            .withBoxDecoration(
              buttonDecoration,
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
    );
  }
}
