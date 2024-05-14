import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class SelectMatchUserScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget header;
  final Widget tab;
  final Widget stakeHolders;

  SelectMatchUserScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.header,
    required this.tab,
    required this.stakeHolders,
  });

  @override
  Widget buildScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        tab,
        const Gap(20).setHeight(),
        Expanded(child: stakeHolders),
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
