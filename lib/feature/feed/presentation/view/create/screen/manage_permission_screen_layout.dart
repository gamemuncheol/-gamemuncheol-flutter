import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ManagePermissionScreenLayout extends StatelessWidget {
  final Widget header;
  final Widget galleryPermissionButton;
  final Widget cameraPermissionButton;

  const ManagePermissionScreenLayout({
    super.key,
    required this.header,
    required this.galleryPermissionButton,
    required this.cameraPermissionButton,
  });

  @override
  Widget build(BuildContext context) {
    final double horizonalPadding = 16.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizonalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40.h),
          header,
          Gap(70.h),
          galleryPermissionButton,
          Gap(24.h),
          cameraPermissionButton,
        ],
      ),
    );
  }
}
