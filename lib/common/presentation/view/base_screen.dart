import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/theme/app_theme.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/theme/custom_color_theme.dart';
import 'package:gamemuncheol/common/theme/custom_text_style_theme.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/blur_layout.dart';

abstract class BaseScreen extends HookConsumerWidget {
  BaseScreen({super.key});

  // 테마
  final CustomColorTheme colorTheme = ThemeService.colorTheme;

  // 테마
  final CustomTextStyleTheme textStyleTheme = ThemeService.textStyleTheme;

  // blurLayout 적용 시 watch할 provider
  dynamic get provider => null;

  // 키보드 올라올 때 bottomInset 자동 조정
  bool get resizeToAvoidBottomInset => false;

  // 앱바
  AppBar? buildAppBar() => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (provider != null) {
      return BlurLayout<LoadingState>(
        provider: provider,
        screen: buildDefalutLayout(context, ref),
      );
    }

    return buildDefalutLayout(context, ref);
  }

  Widget buildDefalutLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: context.colorTheme.background,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: buildScreen(context, ref),
    );
  }

  Widget buildScreen(BuildContext context, WidgetRef ref);
}
