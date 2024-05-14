import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gamemuncheol/common/presentation/layout/default_layout.dart';

class HomeScreenScaffold extends HookWidget {
  final Widget appBar;
  final Widget tabBar;
  final Widget tabBarView;

  const HomeScreenScaffold({
    super.key,
    required this.appBar,
    required this.tabBar,
    required this.tabBarView,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16.w;

    return DefaultLayout(
      child: SafeArea(
        top: true,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: appBar,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              sliver: tabBar,
            ),
          ],
          body: tabBarView,
        ),
      ),
    );
  }
}
