// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/feature/board/presentation/view/home/home_feed_screen.dart';
import 'package:gamemuncheol/feature/board/presentation/view/recent/recent_feed_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen.dart';
import 'package:gamemuncheol/common/presentation/view/home/event/home_screen_event.dart';
import 'package:gamemuncheol/common/presentation/view/home/home_screen_layout.dart';
import 'package:gamemuncheol/common/presentation/view/home/widget/home_app_bar.dart';
import 'package:gamemuncheol/common/presentation/view/home/widget/home_tab_bar.dart';

class HomeScreen extends BaseScreen with HomeScreenEvent {
  HomeScreen({super.key});

  static const PATH = "/home";
  static const NAME = "HomeScreen";

  final List<String> tabs = ["홈", "최근", "인기", "레전드"];
  final List<Widget> tabViews = [
    const HomeBoardScreen(),
    const RecentBoardScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final PageController pageController = usePageController();

    return HomeScreenLayout(
      appBar: buildCustomAppBar(
        onSearchIconTap: onSearchIconTap,
        onNotiIconTap: () => onNotiIconTap(ref),
      ),
      tabBar: buildTabBar(tabs: tabs),
      tabBarView:
          buildTabBarView(pageController: pageController, tabViews: tabViews),
    );
  }

  Widget buildCustomAppBar({
    required VoidCallback onSearchIconTap,
    required VoidCallback onNotiIconTap,
  }) {
    return HomeAppBar(
      onSearchIconTap: onSearchIconTap,
      onNotiIconTap: onNotiIconTap,
    );
  }

  Widget buildTabBar({required List<String> tabs}) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HomeTabBarDelegate(tabs: tabs),
    );
  }

  Widget buildTabBarView({
    required List<Widget> tabViews,
    required PageController pageController,
  }) {
    return PageView(controller: pageController, children: tabViews);
  }
}
