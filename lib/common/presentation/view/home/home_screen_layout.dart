import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenLayout extends StatelessWidget {
  final Widget appBar;
  final Widget tabBar;
  final Widget tabBarView;

  const HomeScreenLayout({
    super.key,
    required this.appBar,
    required this.tabBar,
    required this.tabBarView,
  });

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16.w;

    return SafeArea(
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
    );
  }
}
