import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class HomeScreenScaffold extends HookWidget {
  // 탭들
  final List<Widget> tabViews;

  // 헤더
  final List<Widget> headerSlivers;

  const HomeScreenScaffold({
    super.key,
    required this.tabViews,
    required this.headerSlivers,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();

    return DefaultLayout(
      child: DefaultTabController(
        length: tabViews.length,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) =>
              headerSlivers,
          body: TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
