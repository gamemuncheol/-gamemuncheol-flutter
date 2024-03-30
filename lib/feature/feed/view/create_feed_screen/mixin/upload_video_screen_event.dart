import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/util/snack_bar_util.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol/common/permission/permission_handler.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart.dart';

mixin UploadVideoScreenEvent {
  void listenState(
    BuildContext context,
    WidgetRef ref,
  ) {
    ref.listen(uploadVideoNotiferProvider, (previous, next) {
      if (next.state.isError && next.error!.message.isNotEmpty) {
        SnackBarUtils.snackBar(context, text: next.error!.message);
      } else if (next.state.isLoaded) {
        SnackBarUtils.snackBar(context, text: "업로드 성공!");
      }
    });
  }

  Future<ExtraData?> checkPermission() async {
    // 안드로이드는 권한이 필요 없음
    bool hasGalleryPermission = Platform.isAndroid
        ? true
        : await PermissionHandlerHelper.checkPermission(Permission.photos);

    bool hasCameraPermission =
        await PermissionHandlerHelper.checkPermission(Permission.camera);

    if (!hasGalleryPermission || !hasCameraPermission) {
      final ExtraData extraData = ExtraData({
        "hasGalleryPermission": hasGalleryPermission,
        "hasCameraPermission": hasCameraPermission,
      });

      return extraData;
    }

    return null;
  }

  void selectVideo(BuildContext context, WidgetRef ref) async {
    final ExtraData? extraData = await checkPermission();
    final bool selectable = extraData == null;

    if (selectable) {
      await ref.read(uploadVideoNotiferProvider.notifier).uploadVideo();
    } else {
      if (context.mounted) {
        context.pushNamed(
          RequestGalleryAndCameraPermissionScreen.ROUTE_NAME,
          extra: extraData,
        );
      }
    }
  }

  void useGallery({
    required ValueNotifier<bool> fromGallery,
  }) {
    fromGallery.value = true;
  }

  void useUrl({
    required ValueNotifier<bool> fromGallery,
  }) {
    fromGallery.value = false;
  }

  void enterUrl() {}

  void goNextStep() {}
}
