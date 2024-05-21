import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/config/theme/app_theme.dart';
import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';

class DarkTheme extends ApplicationTheme {
  static DarkTheme get instance {
    return DarkTheme._init();
  }

  DarkTheme._init();

  @override
  ThemeExtension<ThemeExtension> get textStyleTheme {
    return CustomTextStyleTheme(defaultColor: AppColor.primaryWhite);
  }

  @override
  ThemeExtension get colorTheme => CustomColorTheme(
        natural02: AppColor.natural06,
        natural03: AppColor.natural05,
        natural04: AppColor.natural04,
        natural05: AppColor.natural03,
        natural06: AppColor.natural02,
        primaryBlue: AppColor.primaryBlue,
        onPrimaryBlue: AppColor.primaryBlack,
        primaryGreen: AppColor.primaryGreen,
        onPrimaryGreen: AppColor.primaryBlack,
        background: AppColor.primaryBlack,
      );
}
