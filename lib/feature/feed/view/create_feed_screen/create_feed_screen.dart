// ignore_for_file: constant_identifier_names

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_history_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/next_button.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/app_bar.dart';

class CreateFeedScreenHome extends HookWidget {
  const CreateFeedScreenHome({
    super.key,
  });

  static const PATH = "create_feed_screen_home";
  static const ROUTE_NAME = "CreateFeedScreenHome";

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController();

    final List<Widget> pages = [
      const SearchMatchHistoryScreen(),
      Container(
        color: Colors.teal,
      ),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
    ];

    return CreateFeedScreenHomeScaffold(
      topBar: renderAppBar(
        pageController: pageController,
        totalPageLength: pages.length,
      ),
      pages: renderPages(
        pageController: pageController,
        pages: pages,
      ),
      nextButton: renderNextButton(
        pageController: pageController,
      ),
    );
  }

  Widget renderAppBar({
    required PageController pageController,
    required int totalPageLength,
  }) {
    return CustomAppBar(
      pageController: pageController,
      totalPageLength: totalPageLength,
    );
  }

  Widget renderPages({
    required PageController pageController,
    required List<Widget> pages,
  }) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: pages,
    );
  }

  Widget renderNextButton({
    required PageController pageController,
  }) {
    return NextButton(
      pageController: pageController,
    );
  }
}
