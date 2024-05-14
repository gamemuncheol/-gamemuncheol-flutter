import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class ChangeThumbImageScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget thumbImage;
  final Widget thumbImageChangeButton;

   ChangeThumbImageScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.thumbImage,
    required this.thumbImageChangeButton,
  });

  @override
  double get horizontalPadding => 0;

  @override
  Widget buildScaffold(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(80).setHeight(),
          thumbImage,
          const Gap(58).setHeight(),
          thumbImageChangeButton,
        ],
      ),
    );
  }

  @override
  Widget buildStepBar() {
    const double horizontalPadding = 32;

    return PaddingBuilder()
        .setPadding(horizontal: horizontalPadding)
        .setChild(stepBar);
  }

  @override
  Widget? buildBottomButton() {
    return bottomButton;
  }
}
