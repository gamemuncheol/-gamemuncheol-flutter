import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class SearchMatchScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget header;
  final Widget searchBar;
  final Widget searchResult;

  SearchMatchScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.header,
    required this.searchBar,
    required this.searchResult,
  });

  @override
  Widget buildScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        searchBar,
        const Gap(32).setHeight(),
        Expanded(child: searchResult),
      ],
    );
  }

  @override
  Widget buildStepBar() {
    return stepBar;
  }

  @override
  Widget? buildBottomButton() {
    return bottomButton;
  }
}
