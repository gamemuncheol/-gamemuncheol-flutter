// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  // 뒤로가기 시 수행할 로직
  final Future<bool> Function()? onWillPop;

  // 레이아웃을 적용할 화면
  final Widget child;

  // 앱바 따로 사용 시
  final PreferredSizeWidget? customAppBar;

  const DefaultLayout({
    this.onWillPop,
    required this.child,
    this.customAppBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: ColorGuidance.PRIMARY_WITHE,
        body: child,
      ),
    );
  }
}
