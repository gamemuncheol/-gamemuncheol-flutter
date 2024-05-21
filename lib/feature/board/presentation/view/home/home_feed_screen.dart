import 'package:flutter/material.dart';

import 'package:gamemuncheol/common/presentation/widget/pagination_list_view.dart';

class HomeBoardScreen extends StatelessWidget {
  const HomeBoardScreen({
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
