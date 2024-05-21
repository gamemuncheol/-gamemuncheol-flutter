import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/common/service/snack_bar_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/config/theme/custom_color_theme.dart';
import 'package:gamemuncheol/config/theme/custom_text_style_theme.dart';

import 'package:gamemuncheol/common/model/base_state.dart';
import 'package:gamemuncheol/common/presentation/layout/blur_layout.dart';

abstract class BaseScreen extends HookConsumerWidget
    with DialogService, SnackBarService {
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
  PreferredSizeWidget? buildAppBar(WidgetRef ref) => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (provider != null) {
      return BlurLayout<LoadingState>(
        provider: provider,
        screen: _buildDefalutLayout(context, ref),
      );
    }

    // blurLayout 미적용 시
    return _buildDefalutLayout(context, ref);
  }

  Widget _buildDefalutLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: buildAppBar(ref),
      backgroundColor: colorTheme.background,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: buildScreen(context, ref),
    );
  }

  Widget buildScreen(BuildContext context, WidgetRef ref);
}
