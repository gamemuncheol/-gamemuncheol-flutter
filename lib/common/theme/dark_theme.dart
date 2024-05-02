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
    return CustomTextStyleTheme(defaultColor: AppColor.PRIMARY_WITHE);
  }

  @override
  ThemeExtension get colorTheme => CustomColorTheme(
        natural02: AppColor.NATURAL_06,
        natural03: AppColor.NATURAL_05,
        natural04: AppColor.NATURAL_04,
        natural05: AppColor.NATURAL_03,
        natural06: AppColor.NATURAL_02,
        primaryBlue: AppColor.PRIMARY_BLUE,
        onPrimaryBlue: AppColor.PRIMARY_WITHE,
        primaryGreen: AppColor.PRIMARY_GREEN,
        onPrimaryGreen: AppColor.PRIMARY_WITHE,
        background: AppColor.PRIMARY_BLACK,
      );
}
