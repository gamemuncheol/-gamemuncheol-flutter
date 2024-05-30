import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';

class CreateFeedScreenAppBar extends StatelessWidget with ThemeProvider {
  final VoidCallback onLeadingTap;
  final int currentStep;

  const CreateFeedScreenAppBar({
    super.key,
    required this.onLeadingTap,
    required this.currentStep,
  });

  factory CreateFeedScreenAppBar.step1({required VoidCallback onLeadingTap}) {
    return CreateFeedScreenAppBar(onLeadingTap: onLeadingTap, currentStep: 1);
  }
  factory CreateFeedScreenAppBar.step2({required VoidCallback onLeadingTap}) {
    return CreateFeedScreenAppBar(onLeadingTap: onLeadingTap, currentStep: 2);
  }
  factory CreateFeedScreenAppBar.step3({required VoidCallback onLeadingTap}) {
    return CreateFeedScreenAppBar(onLeadingTap: onLeadingTap, currentStep: 3);
  }
  factory CreateFeedScreenAppBar.step4({required VoidCallback onLeadingTap}) {
    return CreateFeedScreenAppBar(onLeadingTap: onLeadingTap, currentStep: 4);
  }

  factory CreateFeedScreenAppBar.step5({required VoidCallback onLeadingTap}) {
    return CreateFeedScreenAppBar(onLeadingTap: onLeadingTap, currentStep: 5);
  }

  final double elevation = 0;
  final int totalStep = 5;

  @override
  Widget build(BuildContext context) {
    final double leadingWidth = 44.w;
    final double leadingPadding = 16.w;

    final double actionPadding = 16.w;

    final TextStyle stepStyle =
        textStyleTheme.body3R.copyWith(color: colorTheme.natural04);

    return AppBar(
      elevation: elevation,
      backgroundColor: colorTheme.background,
      leadingWidth: leadingWidth,
      leading: GestureDetector(
        onTap: onLeadingTap,
        child: Padding(
          padding: EdgeInsets.only(left: leadingPadding),
          child: SvgPicture.asset(
            AppAsset.CHEVRON_LEFT_BLACK,
          ),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(right: actionPadding),
            child: Row(
              children: [
                Text(
                  "$currentStep/$totalStep",
                  style: stepStyle,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
