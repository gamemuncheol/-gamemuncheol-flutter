import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/presentation/widget/pagination_list_view.dart';

class RecentBoardScreen extends StatelessWidget {
  const RecentBoardScreen({
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
