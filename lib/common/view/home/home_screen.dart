// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gamemuncheol/common/view/home/home_screen_scaffold.dart';
import 'package:gamemuncheol/common/view/home/widget/app_bar.dart';
import 'package:gamemuncheol/common/view/home/widget/tab_bar.dart';
import 'package:gamemuncheol/feature/feed/view/home_feed_screen.dart';
import 'package:gamemuncheol/feature/feed/view/recent_feed_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({
    super.key,
  });

  static const PATH = "/home_screen";
  static const ROUTE_NAME = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController();

    final List<String> tabs = [
      "홈",
      "최근",
      "인기",
      "불판",
    ];

    final List<Widget> tabViews = [
      const HomeFeedScreen(),
      const RecentFeedScreen(),
      Container(),
      Container(),
    ];

    return HomeScreenScaffold(
      appBar: renderAppBar(),
      tabBar: renderTabBar(
        pageController: pageController,
        tabs: tabs,
      ),
      tabBarView: renderCustomTabBarView(
        pageController: pageController,
        tabViews: tabViews,
      ),
    );
  }

  Widget renderAppBar() => const CustomAppBar();

  Widget renderTabBar({
    required PageController pageController,
    required List<String> tabs,
  }) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HomeTabBarDelegate(
        pageController: pageController,
        tabs: tabs,
      ),
    );
  }

  Widget renderCustomTabBarView({
    required PageController pageController,
    required List<Widget> tabViews,
  }) {
    return PageView(
      controller: pageController,
      children: tabViews,
    );
  }
}
