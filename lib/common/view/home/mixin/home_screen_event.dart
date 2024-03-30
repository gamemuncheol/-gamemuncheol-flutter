import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/search_match_history_screen.dart';

mixin HomeScreenEvent {
  void pushSearchMatchHistoryScreen(BuildContext context) {
    context.push(SearchMatchHistoryScreen.PATH);
  }

  listenPageChanged({
    required PageController pageController,
    required ValueNotifier<int> currentIndex,
  }) {
    pageController.addListener(() {
      _pageListener(pageController: pageController, currentIndex: currentIndex);
    });
  }

  void _pageListener({
    required PageController pageController,
    required ValueNotifier<int> currentIndex,
  }) {
    final bool isDetached = pageController.hasClients;
    if (isDetached) {
      final int changedIndex = pageController.page!.toInt();
      currentIndex.value = changedIndex;
    }
  }

  void jumpTab({
    required PageController pageController,
    required int index,
  }) {
    final bool isDetached = pageController.hasClients;

    if (isDetached) {
      pageController.jumpToPage(index);
    }
  }
}
