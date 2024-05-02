import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/layout/default_layout.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/create_feed_screen_base.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/gap.dart';

class RequestGalleryAndCameraPermissionScreenScaffold
    extends CreateFeedScreenBase {
  final Widget header;
  final Widget galleryPermissionButton;
  final Widget cameraPermissionButton;

  const RequestGalleryAndCameraPermissionScreenScaffold({
    super.key,
    required super.stepBar,
    required this.header,
    required this.galleryPermissionButton,
    required this.cameraPermissionButton,
  });

  @override
  Widget renderScaffold() {
    const double horizontalPadding = 16;

    return DefaultLayout(
      child: PaddingBuilder()
          .setPadding(
            horizontal: horizontalPadding,
          )
          .setChild(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40).setHeight(),
                header,
                const Gap(70).setHeight(),
                galleryPermissionButton,
                const Gap(24).setHeight(),
                cameraPermissionButton,
              ],
            ),
          ),
    );
  }
}
