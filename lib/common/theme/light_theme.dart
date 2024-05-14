import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/theme/custom_color_theme.dart';
import 'package:gamemuncheol/common/theme/custom_text_style_theme.dart';

class LightTheme extends ApplicationTheme {
  static LightTheme get instance {
    return LightTheme._init();
  }

  LightTheme._init();

  @override
  ThemeExtension<ThemeExtension> get textTheme {
    return CustomTextStyleTheme(defaultColor: AppColor.primaryBlack);
  }

  @override
  ThemeExtension get colorTheme => CustomColorTheme(
        natural02: AppColor.natural02,
        natural03: AppColor.natural03,
        natural04: AppColor.natural04,
        natural05: AppColor.natural05,
        natural06: AppColor.natural06,
        primaryBlue: AppColor.primaryBlue,
        onPrimaryBlue: AppColor.primaryWhite,
        primaryGreen: AppColor.primaryGreen,
        onPrimaryGreen: AppColor.primaryWhite,
        background: AppColor.primaryWhite,
      );
}
