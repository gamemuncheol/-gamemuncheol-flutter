import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamemuncheol/common/extension/theme_data_short_cut.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/presentation/layout/bottom_button_expanded_layout.dart';

class EnterYoutubeUrlScreenLayout extends BottomButtonExpandedLayout {
  final Widget bottomButton;

  final Widget header;
  final Widget textField;
  final Widget videoPreview;

  const EnterYoutubeUrlScreenLayout({
    super.key,
    required this.bottomButton,
    required this.header,
    required this.textField,
    required this.videoPreview,
  });

  @override
  double get horizontalPadding => 0;

  @override
  Widget buildBottomButton() => bottomButton;

  @override
  Widget buildLayout(BuildContext context) {
    final double horizontalPadding = 16.w;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Container(
        color: context.colorTheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header,
                  Gap(70.h),
                  textField,
                ],
              ),
            ),
            Expanded(
              child: videoPreview,
            ),
          ],
        ),
      ),
    );
  }
}
