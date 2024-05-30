import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';

class AppDialog extends StatelessWidget with ThemeProvider {
  final String title;
  final String description;
  final VoidCallback onSignleButtonTap;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onSignleButtonTap,
  });

  factory AppDialog.singleButton({
    required String title,
    required String description,
    required VoidCallback onSignleButtonTap,
  }) {
    return AppDialog(
      title: title,
      description: description,
      onSignleButtonTap: onSignleButtonTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double frameWidth = 262.w;
    final double frameHeight = 330.h;
    final frameDeoration = BoxDecoration(color: colorTheme.transParent);

    final double dialogHeight = 280.h;
    final dialogDeoration = BoxDecoration(
        borderRadius: BorderRadius.circular(28), color: colorTheme.natural02);

    double imageHeight = 130.h;

    return Stack(
      children: [
        Container(
          width: frameWidth,
          height: frameHeight,
          decoration: frameDeoration,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(30.h),
            Container(
              height: dialogHeight,
              decoration: dialogDeoration,
              child: buildContent(
                title: title,
                description: description,
              ),
            )
          ],
        ),
        SizedBox(
          width: frameWidth,
          height: imageHeight,
          child: Image.asset(AppAsset.DIALOG_ICON),
        ),
      ],
    );
  }

  Widget buildContent({
    required String title,
    required String description,
  }) {
    final TextStyle titleStyle = textStyleTheme.title4B;
    final TextStyle descriptionStyle =
        textStyleTheme.body5R.copyWith(color: colorTheme.natural06);

    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        Gap(18.h),
        Text(
          description,
          style: descriptionStyle,
          textAlign: TextAlign.center,
        ),
        Gap(22.h),
        buildSingleButton(),
        Gap(26.h),
      ],
    );
  }

  Widget buildSingleButton() {
    final double buttonWidth = 230.w;
    final double buttonHeight = 44.h;

    final double horizontalMargin = 32.w;

    const String label = "확인";
    final TextStyle labelStyle =
        textStyleTheme.body4M.copyWith(color: colorTheme.onPrimaryBlue);

    final buttonDeoration = BoxDecoration(
      borderRadius: BorderRadius.circular(28),
      color: colorTheme.primaryBlue,
    );
    return GestureDetector(
      onTap: onSignleButtonTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        width: buttonWidth,
        height: buttonHeight,
        decoration: buttonDeoration,
        child: Center(
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
