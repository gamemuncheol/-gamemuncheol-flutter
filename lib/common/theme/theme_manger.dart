// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/theme/theme_enum.dart';

final ChangeNotifierProvider<ThemeManger> themeProvider =
    ChangeNotifierProvider((ref) => throw UnimplementedError());

abstract class ThemeManger extends ChangeNotifier {
  late ThemeData currentTheme;
  void changeTheme(ThemeEnum theme);
}

class ThemeManagerImpl extends ChangeNotifier implements ThemeManger {
  ThemeManagerImpl(this.currentThemeEnum) {
    currentTheme = currentThemeEnum.generateTheme;
  }

  @override
  late ThemeData currentTheme;
  ThemeEnum currentThemeEnum;

  @override
  void changeTheme(ThemeEnum newTheme) {
    if (newTheme != currentThemeEnum) {
      currentTheme = newTheme.generateTheme;
      currentThemeEnum = newTheme;
      notifyListeners();
    }
    return;
  }
}
