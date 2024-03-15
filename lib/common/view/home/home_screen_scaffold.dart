import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class HomeScreenScaffold extends HookWidget {
  // 앱바
  final Widget appBar;

  // 탭
  final Widget tabBar;

  // 탭바뷰
  final Widget tabBarView;

  const HomeScreenScaffold({
    super.key,
    required this.appBar,
    required this.tabBar,
    required this.tabBarView,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        top: true,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            appBar,
            tabBar,
          ],
          body: tabBarView,
        ),
      ),
    );
  }
}
