import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy/privacy_policy_screen_base_layout.dart';

class PrivacyPolicySummaryScreenLayout
    extends PrivacyPolicyScreenBaseLayout {
  final Widget nextButton;

  final Widget sheetHeader;
  final Widget divider;
  final Widget summary;

  const PrivacyPolicySummaryScreenLayout({
    super.key,
    required this.nextButton,
    required this.sheetHeader,
    required this.divider,
    required this.summary,
  });

  @override
  Widget buildLayout() {
    return Column(
      children: [
        SafeArea(child: sheetHeader),
        divider,
        Expanded(child: summary),
      ],
    );
  }

  @override
  Widget buildNextButton() => nextButton;
}
