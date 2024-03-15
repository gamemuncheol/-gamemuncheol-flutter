// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  // 뒤로가기 시 수행할 로직
  final Future<bool> Function()? onWillPop;

  // 레이아웃을 적용할 화면
  final Widget child;

  const DefaultLayout({
    this.onWillPop,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorGuidance.PRIMARY_WITHE,
        body: child,
      ),
    );
  }
}
