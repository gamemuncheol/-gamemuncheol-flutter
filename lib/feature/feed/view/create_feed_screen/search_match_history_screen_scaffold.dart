import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base_scaffold.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class SearchMatchHistoryScreenScaffold extends CreateFeedScreenScaffoldBase {
  final Widget header;
  final Widget searchBar;
  final Widget matchHistory;

  const SearchMatchHistoryScreenScaffold({
    super.key,
    required super.appBar,
    required super.nextButton,
    required this.header,
    required this.searchBar,
    required this.matchHistory,
  });

  @override
  Widget renderScaffold() {
    const double horizontalPadding = 16;

    return SingleChildScrollView(
      child: PaddingBuilder()
          .withPadding(
            horizontal: horizontalPadding,
          )
          .withChild(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40).withHeight(),
                header,
                const Gap(70).withHeight(),
                searchBar,
                const Gap(32).withHeight(),
                matchHistory,
              ],
            ),
          ),
    );
  }
}
