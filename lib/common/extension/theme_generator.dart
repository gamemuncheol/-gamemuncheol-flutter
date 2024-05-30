import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/config/theme/theme_enum.dart';
import 'package:gamemuncheol/config/theme/dark_theme.dart';
import 'package:gamemuncheol/config/theme/light_theme.dart';

extension ThemeGenerator on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.light:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: AppColor.transParent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            LightTheme.instance.colorTheme,
            LightTheme.instance.textStyleTheme,
          ],
        );
      case ThemeEnum.dark:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: AppColor.transParent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            DarkTheme.instance.colorTheme,
            DarkTheme.instance.textStyleTheme,
          ],
        );
      default:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: AppColor.transParent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            LightTheme.instance.colorTheme,
            LightTheme.instance.textStyleTheme,
          ],
        );
    }
  }
}