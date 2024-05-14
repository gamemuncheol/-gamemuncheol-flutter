import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gap/gap.dart';

class UploadButton extends StatelessWidget {
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
    return UploadButton(
      onTap: onTap,
      selected: selected,
      label: "갤러리, 카메라 업로드",
      iconPaths: const [AppAsset.galleryOn, AppAsset.galleryOff],
    );
  }

  factory UploadButton.youtubeUrlUploadButton({
    required bool selected,
    required VoidCallback onTap,
  }) {
    return UploadButton(
      onTap: onTap,
      selected: selected,
      label: "유튜브 url 업로드",
      iconPaths: const [AppAsset.youtubeOn, AppAsset.youtubeOff],
    );
  }

  @override
  Widget build(BuildContext context) {
    final String iconPath = selected ? iconPaths.first : iconPaths.last;

    final BoxDecoration buttonDecoration = BoxDecoration(
      color: context.colorTheme.background,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: selected
            ? context.colorTheme.primaryBlue
            : context.colorTheme.natural04,
      ),
    );

    TextStyle labelStyle = context.textStyleTheme.body4M.copyWith(
      color: selected
          ? context.colorTheme.primaryBlue
          : context.colorTheme.natural04,
    );

    const double buttonWidth = 357;
    const double buttonHeight = 64;

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .setWidth(buttonWidth)
          .setHeigh(buttonHeight)
          .setBoxDecoration(buttonDecoration)
          .setChild(
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconPath),
                  const Gap(6).setWidth(),
                  Text(label, style: labelStyle),
                ],
              ),
            ),
          ),
    );
  }
}
