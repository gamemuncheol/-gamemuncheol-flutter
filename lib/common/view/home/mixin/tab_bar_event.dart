import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/view/home/widget/tab_bar.dart';

mixin CustomTabBarEvent on State<CustomTabBar> {
  int get currentIndex => _currentIndex;
  late int _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
  }

  listenPageChanged() {
    widget.pageController.addListener(
      pageListener,
    );
  }

  void pageListener() {
    final bool isDetached = widget.pageController.hasClients;

    if (isDetached) {
      final int changedIndex = widget.pageController.page!.toInt();
      setState(() {
        currentIndex = changedIndex;
      });
    }
  }

  void jump({
    required int index,
  }) {
    widget.pageController.jumpToPage(
      index,
    );
  }
}
