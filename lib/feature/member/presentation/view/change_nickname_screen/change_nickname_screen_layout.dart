import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class ChangeNickNameScreenLayout extends BottomButtonExpandedLayout {
  final Widget header;
  final Widget textField;
  final Widget errorText;
  final Widget completeButton;

  const ChangeNickNameScreenLayout({
    super.key,
    required this.header,
    required this.textField,
    required this.errorText,
    required this.completeButton,
  });

  @override
  Widget buildBottomButton() => completeButton;

  @override
  Widget buildBottomButtonExpandedLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(60.h),
        header,
        Gap(120.h),
        textField,
        Gap(16.h),
        errorText,
      ],
    );
  }
}
