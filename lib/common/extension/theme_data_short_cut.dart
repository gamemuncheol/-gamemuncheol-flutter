import 'package:flutter/material.dart';

import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';
import 'package:gamemuncheol/common/extension/theme_data_extended.dart';

extension ThemeDataShortcut on BuildContext {
  CustomColorTheme get colorTheme => Theme.of(this).colorTheme;
  CustomTextStyleTheme get textStyleTheme => Theme.of(this).textStyleTheme;
}
