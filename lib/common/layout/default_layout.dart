// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/widget/app_text.dart';

class DefaultLayout extends StatelessWidget {
  // 뒤로가기 시 수행할 로직
  final Future<bool> Function()? onWillPop;

  // 하위 위젯
  final Widget child;

  // 앱바 제목
  final String? appBarTitle;

  // 앱바 액션들
  final List<Widget>? actions;

  // 앱바 따로 사용
  final PreferredSizeWidget? customAppBar;

  const DefaultLayout({
    this.onWillPop,
    required this.child,
    this.appBarTitle,
    this.actions,
    this.customAppBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: renderAppBar(),
        backgroundColor: AppColors.PRIMARY_WITHE,
        body: child,
      ),
    );
  }

  PreferredSizeWidget? renderAppBar() {
    if (customAppBar != null) {
      return customAppBar;
    }

    if (appBarTitle != null) {
      return AppBar(
        elevation: 0,
        foregroundColor: AppColors.PRIMARY_BLACK,
        backgroundColor: AppColors.PRIMARY_WITHE,
        centerTitle: false,
        title: AppText(
          appBarTitle!,
        ),
        actions: actions,
      );
    }

    return null;
  }
}
