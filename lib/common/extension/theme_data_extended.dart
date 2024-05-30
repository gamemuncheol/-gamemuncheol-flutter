import 'package:flutter/material.dart';

import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';

// ThemeData에 커스텀 테마 편입
extension ThemeDataExtended on ThemeData {
  CustomColorTheme get colorTheme => extension<CustomColorTheme>()!;
  CustomTextStyleTheme get textStyleTheme => extension<CustomTextStyleTheme>()!;
}
