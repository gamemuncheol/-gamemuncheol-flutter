// ignore_for_file: constant_identifier_names

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/asset_paths.dart';

import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/util/app_container.dart';
import 'package:gamemuncheol/common/util/app_padding.dart';
import 'package:gamemuncheol/common/util/app_sized_box.dart';
import 'package:gamemuncheol/common/util/app_text_style.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/request_gallery_and_camera_permission_screen_event.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen_scaffold.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/widget/header.dart';
import 'package:go_router/go_router.dart';

class RequestGalleryAndCameraPermissionScreen extends HookWidget
    with RequestGalleryAndCameraPermissionEvent {
  final bool hasGalleryPermission;
  final bool hasCameraPermission;

  const RequestGalleryAndCameraPermissionScreen({
    super.key,
    required this.hasGalleryPermission,
    required this.hasCameraPermission,
  });

  static const PATH = "/request_gallery_and_camera_permission_screen";
  static const ROUTE_NAME = "RequestGalleryAndCameraPermissionScreen";

  factory RequestGalleryAndCameraPermissionScreen.fromExtraData(
    ExtraData extraData,
  ) {
    return RequestGalleryAndCameraPermissionScreen(
      hasGalleryPermission: extraData.data["hasGalleryPermission"],
      hasCameraPermission: extraData.data["hasCameraPermission"],
    );
  }

  void goPreStep(BuildContext context) => context.pop();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> hasGalleryPermission = useState(
      this.hasGalleryPermission,
    );

    final ValueNotifier<bool> hasCameraPermission = useState(
      this.hasCameraPermission,
    );

    return RequestGalleryAndCameraPermissionScreenScaffold(
      appBar: renderAppBar(context),
      header: renderHeader(),
      galleryPermissionButton: renderGalleryPermissionButton(
        context,
        hasCameraPermission: hasGalleryPermission,
      ),
      cameraPermissionButton: renderCameraPermissionButton(
        context,
        hasCameraPermission: hasCameraPermission,
      ),
    );
  }

  Widget renderAppBar(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 7;
    const double frameWidth = 390;
    const double frameHeight = 56;

    return SafeArea(
      child: PaddingBuilder()
          .withPadding(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          )
          .withChild(
            SizedBoxBuilder()
                .withSize(
                  width: frameWidth,
                  height: frameHeight,
                )
                .withChild(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => goPreStep(context),
                        child: SvgPicture.asset(AppAsset.CANCLE_ICON_PATH),
                      )
                    ],
                  ),
                ),
          ),
    );
  }

  Widget renderHeader() {
    return const CreateFeedScreenHeader(
      title: "카메라와 앨범에 접근 할\n수 있도록 허용해 주세요.",
    );
  }

  Widget renderGalleryPermissionButton(
    BuildContext context, {
    required ValueNotifier<bool> hasCameraPermission,
  }) {
    return renderButton(
      selected: hasCameraPermission.value,
      text: "앨범 읽기, 쓰기 허용",
      onTap: () => requestGalleryPermission(
        context,
        whenGalleryPermissionGranted: () => whenGalleryPermissionGranted(
          hasGalleryPermisson: hasCameraPermission,
        ),
      ),
    );
  }

  Widget renderCameraPermissionButton(
    BuildContext context, {
    required ValueNotifier<bool> hasCameraPermission,
  }) {
    return renderButton(
      selected: hasCameraPermission.value,
      text: "카메라 엑세스 허용",
      onTap: () => requestCameraPermission(
        context,
        whenCameraPermissionGranted: () => whenCameraPermissionGranted(
          hasCameraPermisstion: hasCameraPermission,
        ),
      ),
    );
  }

  Widget renderButton({
    required bool selected,
    required String text,
    required VoidCallback onTap,
  }) {
    final BoxDecoration buttonDecoration = BoxDecoration(
      color: AppColor.PRIMARY_WITHE,
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: selected ? AppColor.PRIMARY_BLUE : AppColor.NATURAL_04,
      ),
    );

    TextStyle textStyle = TextStyleBuilder()
        .withColor(
          selected ? AppColor.PRIMARY_BLUE : AppColor.NATURAL_04,
        )
        .withBold()
        .build();

    const double buttonWidth = 357;
    const double buttonHeight = 64;

    return GestureDetector(
      onTap: onTap,
      child: ContainerBuilder()
          .withSize(
            width: buttonWidth,
            height: buttonHeight,
          )
          .withBoxDecoration(buttonDecoration)
          .withChild(
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.abc),
                  Text(
                    text,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
