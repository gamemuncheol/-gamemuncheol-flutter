import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class PrivacyPolicySummaryScreenLayout extends BottomButtonExpandedLayout {
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
  Widget buildBottomButton() => nextButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return Column(
      children: [
        Gap(40.h),
        SafeArea(
          child: sheetHeader,
        ),
        divider,
        Expanded(
          child: summary,
        ),
      ],
    );
  }
}
