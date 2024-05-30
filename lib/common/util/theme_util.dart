import 'package:flutter/material.dart';

import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';
import 'package:gamemuncheol/common/extension/theme_data_short_cut.dart';

abstract class ThemeUtil {
  ThemeUtil._();

  static late BuildContext _context;

  static void init(BuildContext context) => _context = context;

  static CustomColorTheme get colorTheme => _context.colorTheme;
  static CustomTextStyleTheme get textStyleTheme => _context.textStyleTheme;
}

mixin ThemeProvider {
  CustomColorTheme get colorTheme => ThemeUtil.colorTheme;
  CustomTextStyleTheme get textStyleTheme => ThemeUtil.textStyleTheme;
}
