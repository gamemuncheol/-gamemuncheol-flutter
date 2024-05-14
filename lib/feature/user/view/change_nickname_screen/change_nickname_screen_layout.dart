import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChangeNickNameScreenLayout extends StatelessWidget {
  final Widget title;
  final Widget textField;
  final Widget errorText;
  final Widget nextButton;

  const ChangeNickNameScreenLayout({
    super.key,
    required this.title,
    required this.textField,
    required this.errorText,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16.w;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(60.h),
                title,
                Gap(120.h),
                textField,
                Gap(16.h),
                errorText,
              ],
            ),
          ),
        ),
        nextButton,
      ],
    );
  }
}
