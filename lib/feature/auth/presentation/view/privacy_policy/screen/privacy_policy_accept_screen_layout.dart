import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class PrivacyPolicyAcceptScreenLayout extends BottomButtonExpandedLayout {
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
  Widget buildBottomButton() => nextButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return Column(
      children: [
        Gap(40.h),
        SafeArea(
          child: sheetHeader,
        ),
        accpetAllButton,
        Gap(20.h),
        divider,
        Expanded(
          child: terms,
        ),
      ],
    );
  }
}
