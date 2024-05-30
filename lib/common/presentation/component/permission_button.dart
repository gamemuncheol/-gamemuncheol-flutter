import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gamemuncheol/common/util/theme_util.dart';

class PermissionButton extends StatelessWidget with ThemeProvider {
  final VoidCallback onTap;
  final bool hasPermission;
  final String label;
  final String iconPath;

  const PermissionButton({
    super.key,
    required this.onTap,
    required this.hasPermission,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final buttonDeco = BoxDecoration(
      color: colorTheme.primaryWhite,
      borderRadius: BorderRadius.circular(
        64,
      ),
      border: Border.all(
        color: hasPermission ? colorTheme.primaryBlue : colorTheme.natural04,
      ),
    );

    final labelStyle = textStyleTheme.body3M.copyWith(
        color: hasPermission ? colorTheme.primaryBlue : colorTheme.natural04);

    final double buttonWidth = 357.w;
    final double buttonHeight = 64.h;

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
              SvgPicture.asset(
                iconPath,
              ),
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
