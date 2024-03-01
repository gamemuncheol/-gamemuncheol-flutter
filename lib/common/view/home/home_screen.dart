// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/view/home/home_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/home_feed_screen.dart';
import 'package:gamemuncheol/feature/feed/view/recent_feed_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static const PATH = "/home_screen";
  static const ROUTE_NAME = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    // 탭들
    final List<String> tabs = [
      "홈",
      "최근",
      "인기",
      "불판",
    ];

    // 탭뷰들
    final List<Widget> tabViews = [
      HomeFeedScreen(
        tab: tabs[0],
      ),
      RecentFeedScreen(
        tab: tabs[1],
      ),
      Container(),
      Container(),
    ];

    return HomeScreenScaffold(
      tabViews: tabViews,
      headerSlivers: renderHeaderSlivers(
        tabs: tabs,
      ),
    );
  }

  List<Widget> renderHeaderSlivers({
    required List<String> tabs,
  }) {
    return [
      _HeaderSlivers(
        tabs: tabs,
      ),
    ];
  }
}

class _HeaderSlivers extends ConsumerWidget {
  // 탭들
  final List<String> tabs;

  const _HeaderSlivers({
    required this.tabs,
  });

  final double leadingWidth = 152;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      snap: true,
      pinned: true,
      floating: true,
      backgroundColor: ColorGuidance.PRIMARY_WITHE,
      leadingWidth: leadingWidth,
      leading: renderLeading(),
      bottom: renderTapBar(),
    );
  }

  Widget renderLeading() {
    const double frameWidth = 120;
    const double frameHeight = 38;
    const double horizontalMargin = 16;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: horizontalMargin,
      ),
      color: Colors.blue,
      width: frameWidth,
      height: frameHeight,
    );
  }

  PreferredSizeWidget renderTapBar() {
    return TabBar(
      unselectedLabelStyle: const TextStyle(
        color: ColorGuidance.NATURAL_03,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      labelStyle: const TextStyle(
        color: ColorGuidance.NATURAL_03,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3.0,
      indicatorColor: ColorGuidance.PRIMARY_BLUE,
      dividerColor: ColorGuidance.PRIMARY_WITHE,
      tabs: List.generate(
        tabs.length,
        (index) => Tab(
          text: tabs[index],
        ),
      ),
    );
  }
}
