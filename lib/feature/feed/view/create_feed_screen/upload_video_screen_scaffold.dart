import 'package:flutter/material.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base_scaffold.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class UploadVideoScreenScaffold extends CreateFeedScreenScaffoldBase {
  final Widget header;
  final Widget videoFromGallaryButton;
  final Widget videoFromUrlButton;

  const UploadVideoScreenScaffold({
    super.key,
    required super.appBar,
    required super.nextButton,
    required this.header,
    required this.videoFromGallaryButton,
    required this.videoFromUrlButton,
  });

  @override
  Widget renderScaffold() {
    const double horizontalPadding = 16;

    const double space1 = 70;
    const double space2 = 24;

    return PaddingBuilder()
        .withPadding(
          left: horizontalPadding,
          right: horizontalPadding,
        )
        .withChild(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              const Gap(space1).withHeight(),
              videoFromGallaryButton,
              const Gap(space2).withHeight(),
              videoFromUrlButton,
            ],
          ),
        );
  }
}
