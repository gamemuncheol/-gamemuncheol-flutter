import 'package:flutter/material.dart';

import 'package:gamemuncheol/feature/feed/view/feed_screen_scaffold.dart';

class RecentFeedScreen extends StatelessWidget {
  // 페이지 키
  final String tab;
  const RecentFeedScreen({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return FeedScreenScaffold(
      tab: tab,
      paginationWidgetBuilder: (index) {
        return Center(
          child: Text(
            index.toString(),
          ),
        );
      },
    );
  }
}
