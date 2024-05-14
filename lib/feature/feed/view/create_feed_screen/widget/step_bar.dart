import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/presentation/widget/one_leading_one_action_app_bar.dart';

class FeedStepBar extends StatelessWidget {
  final VoidCallback onLeadingTap;
  final int? currentStep;
  final String? title;
  final Widget? action;

  const FeedStepBar({
    super.key,
    required this.onLeadingTap,
    this.currentStep,
    this.title,
    this.action,
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

  factory FeedStepBar.fullArgument({
    required VoidCallback onLeadingTap,
    required Widget action,
    required String title,
  }) {
    return FeedStepBar(
        onLeadingTap: onLeadingTap, action: action, title: title);
  }

  final int totalStep = 5;

  @override
  Widget build(BuildContext context) {
    final TextStyle stepStyle = context.textStyleTheme.body3R
        .copyWith(color: context.colorTheme.natural04);

    return OneLeadingOneActionAppBar(
      onLeadingTap: onLeadingTap,
      leading: SvgPicture.asset(AppAsset.chevronLeftBlack),
      title: title,
      action: Center(
        child: action ?? Text("$currentStep/$totalStep", style: stepStyle),
      ),
    );
  }
}
