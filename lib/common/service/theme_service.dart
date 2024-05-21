import 'package:flutter/material.dart';

import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';
import 'package:gamemuncheol/common/extension/theme_data_short_cut.dart';

abstract class ThemeService {
  ThemeService._();

  static late BuildContext _context;

  static void init(BuildContext context) => _context = context;

  static CustomColorTheme get colorTheme => _context.colorTheme;
  static CustomTextStyleTheme get textStyleTheme => _context.textStyleTheme;
}

mixin ThemeServiceProvider {
  CustomColorTheme get colorTheme => ThemeService.colorTheme;
  CustomTextStyleTheme get textStyleTheme => ThemeService.textStyleTheme;
}
