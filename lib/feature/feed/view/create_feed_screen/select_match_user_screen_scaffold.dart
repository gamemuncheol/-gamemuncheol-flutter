import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class SelectMatchUserScreenScaffold extends CreateFeedScreenBase {
  final Widget header;
  final Widget tab;
  final Widget stakeHolders;

  const SelectMatchUserScreenScaffold({
    super.key,
    required super.stepBar,
    required super.bottomButton,
    required this.header,
    required this.tab,
    required this.stakeHolders,
  });

  @override
  Widget renderScaffold() {
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
}
