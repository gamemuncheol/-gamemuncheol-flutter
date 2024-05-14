import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/theme/custom_color_theme.dart';
import 'package:gamemuncheol/common/theme/custom_text_style_theme.dart';

abstract class ApplicationTheme {
  late final ThemeExtension colorTheme;
  late final ThemeExtension textTheme;
}

extension ThemeDataShortcut on BuildContext {
  CustomColorTheme get colorTheme => Theme.of(this).colorTheme;
  CustomTextStyleTheme get textStyleTheme => Theme.of(this).textStyleTheme;
}

extension ThemeDataExtended on ThemeData {
  CustomColorTheme get colorTheme => extension<CustomColorTheme>()!;
  CustomTextStyleTheme get textStyleTheme => extension<CustomTextStyleTheme>()!;
}
