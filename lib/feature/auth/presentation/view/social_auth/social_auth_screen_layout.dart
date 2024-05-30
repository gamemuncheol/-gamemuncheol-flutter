import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SocialAuthScreenLayout extends StatelessWidget {
  final Widget backgroundVideo;
  final Widget mainTitle;
  final Widget appleSignInBtn;
  final Widget googleSignInBtn;

  const SocialAuthScreenLayout({
    super.key,
    required this.backgroundVideo,
    required this.mainTitle,
    required this.appleSignInBtn,
    required this.googleSignInBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        backgroundVideo,
        Column(
          children: [
            Gap(148.h),
            mainTitle,
            Gap(148.h),
            appleSignInBtn,
            Gap(26.h),
            googleSignInBtn,
            Gap(74.h),
          ],
        )
      ],
    );
  }
}
