import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/layout/default_layout.dart';

class CreateFeedScreenHomeScaffold extends StatelessWidget {
  // 탑바
  final Widget topBar;

  // 페이지들
  final Widget pages;

  // 버튼
  final Widget nextButton;

  const CreateFeedScreenHomeScaffold({
    super.key,
    required this.topBar,
    required this.pages,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          topBar,
          Expanded(
            child: pages,
          ),
          nextButton,
        ],
      ),
    );
  }
}
