import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/theme/custom_color_theme.dart';
import 'package:gamemuncheol/common/theme/custom_text_style_theme.dart';

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
