import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class SelectMatchUserScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget header;
  final Widget tab;
  final Widget stakeHolders;

  const SelectMatchUserScreenLayout({
    super.key,
    required this.bottomButton,
    required this.header,
    required this.tab,
    required this.stakeHolders,
  });

  @override
  Widget buildBottomButton() => bottomButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40.h),
        header,
        Gap(70.h),
        tab,
        Gap(20.h),
        Expanded(
          child: stakeHolders,
        ),
      ],
    );
  }
}
