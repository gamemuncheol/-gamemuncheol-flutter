import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';

class CreateFeedScreenAppBar extends StatelessWidget {
  final int currentStep;
  final Map<String, dynamic>? extra;

  const CreateFeedScreenAppBar({
    super.key,
    required this.currentStep,
    this.extra,
  });

  void goPreStep(BuildContext context) => context.pop();

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 7;
    const double frameWidth = 390;
    const double frameHeight = 56;

    return SafeArea(
      bottom: false,
      child: PaddingBuilder()
          .withPadding(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          )
          .withChild(
            SizedBoxBuilder()
                .withSize(
                  width: frameWidth,
                  height: frameHeight,
                )
                .withChild(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      renderBackButton(context),
                      renderCurrentStep(),
                    ],
                  ),
                ),
          ),
    );
  }

  Widget renderBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => goPreStep(context),
      child: Container(
        color: AppColor.PRIMARY_WITHE,
        child: SvgPicture.asset(
          AppAsset.CHEVRON_LEFT_ICON_PATH,
        ),
      ),
    );
  }

  Widget renderCurrentStep() {
    const double frameWidth = 40;
    const double frameHeight = 24;

    final TextStyle stepStyle = TextStyleBuilder()
        .withColor(AppColor.NATURAL_04)
        .withFontSize(18)
        .build();

    return SizedBoxBuilder()
        .withSize(
          width: frameWidth,
          height: frameHeight,
        )
        .withChild(
          Center(
            child: Text(
              "${currentStep.toString()}/5",
              style: stepStyle,
            ),
          ),
        );
  }
}
