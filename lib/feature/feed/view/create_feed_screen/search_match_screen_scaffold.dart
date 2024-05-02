import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class SearchMatchScreenScaffold extends CreateFeedScreenBase {
  final Widget header;
  final Widget searchBar;
  final Widget match;

  const SearchMatchScreenScaffold({
    super.key,
    required super.stepBar,
    required super.bottomButton,
    required this.header,
    required this.searchBar,
    required this.match,
  });

  @override
  Widget renderScaffold() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        searchBar,
        const Gap(32).setHeight(),
        Expanded(child: match),
      ],
    );
  }
}
