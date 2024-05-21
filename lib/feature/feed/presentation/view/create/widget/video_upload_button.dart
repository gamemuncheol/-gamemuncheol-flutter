import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';

import 'package:gap/gap.dart';

class UploadButton extends StatelessWidget with ThemeServiceProvider {
  final VoidCallback onTap;
  final bool selected;
  final String label;
  final List<String> iconPaths;

  const UploadButton({
    super.key,
    required this.onTap,
    required this.selected,
    required this.label,
    required this.iconPaths,
  });

  factory UploadButton.videoUploadButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    const String label = "갤러리, 카메라 업로드";

    return UploadButton(
      onTap: onTap,
      selected: selected,
      label: label,
      iconPaths: const [AppAsset.galleryOn, AppAsset.galleryOff],
    );
  }

  factory UploadButton.youtubeUrlUploadButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    const String label = "유튜브 url 업로드";

    return UploadButton(
      onTap: onTap,
      selected: selected,
      label: label,
      iconPaths: const [AppAsset.youtubeOn, AppAsset.youtubeOff],
    );
  }

  @override
  Widget build(BuildContext context) {
    final String iconPath = selected ? iconPaths.first : iconPaths.last;

    final buttonDeco = BoxDecoration(
      color: colorTheme.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
          color: selected ? colorTheme.primaryBlue : colorTheme.natural04),
    );

    final labelStyle = textStyleTheme.body4M.copyWith(
        color: selected ? colorTheme.primaryBlue : colorTheme.natural04);

    final buttonWidth = 357.w;
    final buttonHeight = 64.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: buttonDeco,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              Gap(6.w),
              Text(
                label,
                style: labelStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
