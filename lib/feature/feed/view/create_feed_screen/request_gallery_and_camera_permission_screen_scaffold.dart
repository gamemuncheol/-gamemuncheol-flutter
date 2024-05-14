import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';

class RequestGalleryAndCameraPermissionScreenScaffold
    extends CreateFeedScreenBaseScaffold {
  final Widget stepBar;

  final Widget header;
  final Widget galleryPermissionButton;
  final Widget cameraPermissionButton;

  RequestGalleryAndCameraPermissionScreenScaffold({
    super.key,
    required this.stepBar,
    required this.header,
    required this.galleryPermissionButton,
    required this.cameraPermissionButton,
  });

  @override
  Widget buildScaffold(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40).setHeight(),
        header,
        const Gap(70).setHeight(),
        galleryPermissionButton,
        const Gap(24).setHeight(),
        cameraPermissionButton,
      ],
    );
  }

  @override
  Widget buildStepBar() {
    return stepBar;
  }

  @override
  Widget? buildBottomButton() {
    return null;
  }
}
