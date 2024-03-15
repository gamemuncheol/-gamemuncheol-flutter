import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/widget/pagination_list_view.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({
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
