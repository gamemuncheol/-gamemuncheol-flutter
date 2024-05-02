import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gap/gap.dart';

class EnterYoutubeUrlScreenScaffold extends CreateFeedScreenBase {
  final Widget header;
  final Widget textField;
  final Widget videoPreview;
  const EnterYoutubeUrlScreenScaffold({
    super.key,
    required super.stepBar,
    required super.bottomButton,
    required this.header,
    required this.textField,
    required this.videoPreview,
  });

  @override
  Widget renderScaffold() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        textField,
        const Gap(70).setHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [videoPreview],
        ),
      ],
    );
  }
}
