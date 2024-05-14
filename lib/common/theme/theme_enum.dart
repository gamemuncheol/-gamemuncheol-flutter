import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/theme/dark_theme.dart';
import 'package:gamemuncheol/common/theme/light_theme.dart';

enum ThemeEnum {
  light,
  dark,
}

extension ThemeGenerator on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.light:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: Colors.transparent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            LightTheme.instance.textTheme,
            LightTheme.instance.colorTheme,
          ],
        );
      case ThemeEnum.dark:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: Colors.transparent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            DarkTheme.instance.textTheme,
            DarkTheme.instance.colorTheme,
          ],
        );
      default:
        return ThemeData(
          useMaterial3: false,
          dialogBackgroundColor: Colors.transparent,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColor.primaryBlue),
        ).copyWith(
          extensions: [
            LightTheme.instance.textTheme,
            LightTheme.instance.colorTheme,
          ],
        );
    }
  }
}
