import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/app_bar.dart';

mixin CustomAppBarEvent on State<CustomAppBar> {
  int get currentPage => _currentPage;
  late int _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  void pageListener() {
    widget.pageController.addListener(() {
      setState(() {
        currentPage = widget.pageController.page!.toInt();
      });
    });
  }

  void goPreStep() {
    const Duration duration = Duration(
      milliseconds: 250,
    );
    Curve curve = Curves.linear;

    if (widget.pageController.page == 0) {
      context.pop();
    } else {
      widget.pageController.previousPage(
        duration: duration,
        curve: curve,
      );
    }
  }
}
