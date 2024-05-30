import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';
import 'package:gap/gap.dart';

class ChangeThumbImageScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget thumbImage;
  final Widget thumbImageChangeButton;

  const ChangeThumbImageScreenLayout({
    super.key,
    required this.bottomButton,
    required this.thumbImage,
    required this.thumbImageChangeButton,
  });

  @override
  Widget buildBottomButton() => bottomButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(80.h),
          thumbImage,
          Gap(58.h),
          thumbImageChangeButton,
        ],
      ),
    );
  }
}
