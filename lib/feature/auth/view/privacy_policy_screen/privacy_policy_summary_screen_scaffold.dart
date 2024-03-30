import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/auth/view/privacy_policy_screen/privacy_policy_sreen_base_scaffold.dart';

class PrivacyPolicySummaryScreenScaffold
    extends PrivacyPolicyScreenBaseScaffold {
  // 헤더
  final Widget sheetHeader;

  // 구분선
  final Widget divider;

  // 처리방침 요약본
  final Widget summary;

  const PrivacyPolicySummaryScreenScaffold({
    super.key,
    required super.nextButton,
    required this.sheetHeader,
    required this.divider,
    required this.summary,
  });

  @override
  Widget renderScaffold() {
    return Column(
      children: [
        SafeArea(child: sheetHeader),
        divider,
        Expanded(child: summary),
      ],
    );
  }
}
