import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/theme/custom_color_theme.dart';
import 'package:gamemuncheol/common/theme/custom_text_style_theme.dart';

class DarkTheme extends ApplicationTheme {
  static DarkTheme get instance {
    return DarkTheme._init();
  }

  DarkTheme._init();

  @override
  ThemeExtension<ThemeExtension> get textTheme {
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
        onPrimaryBlue: AppColor.primaryWhite,
        primaryGreen: AppColor.primaryGreen,
        onPrimaryGreen: AppColor.primaryWhite,
        background: AppColor.primaryBlack,
      );
}
