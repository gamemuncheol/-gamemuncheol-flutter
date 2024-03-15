import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/widget/pagination_list_view.dart';

class RecentFeedScreen extends StatelessWidget {
  const RecentFeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaginationListview(
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
