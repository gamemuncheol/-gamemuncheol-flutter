import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/widget/one_leading_one_action_app_bar.dart';

class FeedStepBar extends StatelessWidget {
  final VoidCallback onLeadingTap;
  final int currentStep;

  const FeedStepBar({
    super.key,
    required this.onLeadingTap,
    required this.currentStep,
  });

  factory FeedStepBar.step1({required VoidCallback onLeadingTap}) {
    return FeedStepBar(onLeadingTap: onLeadingTap, currentStep: 1);
  }
  factory FeedStepBar.step2({required VoidCallback onLeadingTap}) {
    return FeedStepBar(onLeadingTap: onLeadingTap, currentStep: 2);
  }
  factory FeedStepBar.step3({required VoidCallback onLeadingTap}) {
    return FeedStepBar(onLeadingTap: onLeadingTap, currentStep: 3);
  }
  factory FeedStepBar.step4({required VoidCallback onLeadingTap}) {
    return FeedStepBar(onLeadingTap: onLeadingTap, currentStep: 4);
  }

  factory FeedStepBar.step5({required VoidCallback onLeadingTap}) {
    return FeedStepBar(onLeadingTap: onLeadingTap, currentStep: 5);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle stepStyle = context.textStyleTheme.body3R
        .copyWith(color: context.colorTheme.natural04);

    return OneLeadingOneActionAppBar(
      onLeadingTap: onLeadingTap,
      leading: SvgPicture.asset(AppAsset.CHEVRON_LEFT_ICON_PATH),
      actions: Center(child: Text("$currentStep/5", style: stepStyle)),
    );
  }
}
