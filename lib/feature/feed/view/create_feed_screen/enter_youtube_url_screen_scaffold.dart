import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gap/gap.dart';

class EnterYoutubeUrlScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget header;
  final Widget textField;
  final Widget videoPreview;

  EnterYoutubeUrlScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.header,
    required this.textField,
    required this.videoPreview,
  });

  @override
  double get horizontalPadding => 0;

  @override
  Widget buildScaffold(BuildContext context) {
    const double horizontalPadding = 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        PaddingBuilder()
            .setPadding(horizontal: horizontalPadding)
            .setChild(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header,
                const Gap(70).setHeight(),
                textField,
              ],
            )),
        const Gap(70).setHeight(),
        Row(children: [videoPreview]),
      ],
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
