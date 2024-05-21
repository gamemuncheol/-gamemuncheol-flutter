import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';
import 'package:gap/gap.dart';

class UploadVideoScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget header;
  final Widget galleryUploadButton;
  final Widget youtubeURLUploadButton;

  const UploadVideoScreenLayout({
    super.key,
    required this.bottomButton,
    required this.header,
    required this.galleryUploadButton,
    required this.youtubeURLUploadButton,
  });

  @override
  Widget buildLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40.h),
        header,
        Gap(70.h),
        galleryUploadButton,
        Gap(24.h),
        youtubeURLUploadButton,
      ],
    );
  }

  @override
  Widget buildBottomButton() => bottomButton;
}
