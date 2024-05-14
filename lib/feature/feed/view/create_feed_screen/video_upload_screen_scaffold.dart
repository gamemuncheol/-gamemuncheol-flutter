import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class UploadVideoScreenScaffold extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;
  final Widget bottomButton;

  final Widget header;
  final Widget galleryUploadButton;
  final Widget youtubeURLUploadButton;

  UploadVideoScreenScaffold({
    super.key,
    required this.stepBar,
    required this.bottomButton,
    required this.header,
    required this.galleryUploadButton,
    required this.youtubeURLUploadButton,
  });

  @override
  Widget buildScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        galleryUploadButton,
        const Gap(24).setHeight(),
        youtubeURLUploadButton,
      ],
    );
  }

  @override
  Widget buildStepBar() => stepBar;

  @override
  Widget? buildBottomButton() => bottomButton;
}
