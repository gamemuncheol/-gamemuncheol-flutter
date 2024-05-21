import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/feature/auth/view/privacy_policy/privacy_policy_screen_base_layout.dart';
import 'package:gap/gap.dart';

class PrivacyPolicyAcceptScreenLayout extends PrivacyPolicyScreenBaseLayout {
  final Widget nextButton;

  final Widget sheetHeader;
  final Widget accpetAllButton;
  final Widget divider;
  final Widget terms;

  const PrivacyPolicyAcceptScreenLayout({
    super.key,
    required this.nextButton,
    required this.sheetHeader,
    required this.accpetAllButton,
    required this.divider,
    required this.terms,
  });

  @override
  Widget buildLayout() {
    return Column(
      children: [
        SafeArea(child: sheetHeader),
        accpetAllButton,
        Gap(21.h),
        divider,
        Expanded(child: terms),
      ],
    );
  }

  @override
  Widget buildNextButton() => nextButton;
}
