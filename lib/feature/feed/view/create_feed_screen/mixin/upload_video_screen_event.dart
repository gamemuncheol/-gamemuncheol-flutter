import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamemuncheol/common/router/extra_data.dart';
import 'package:gamemuncheol/common/util/dialog_uitl.dart';
import 'package:gamemuncheol/feature/feed/provider/upload_video_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_youtube_url_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:gamemuncheol/common/permission/permission_handler.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart';

mixin UploadVideoScreenEvent {
  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  void listenError(BuildContext context, WidgetRef ref) {
    ref.listen(uploadVideoNotiferProvider, (previous, next) {
      if (next.isError && next.erMessage.isNotEmpty) {
        DialogUtil.show(
          context,
          title: "업로드 실패",
          description: next.erMessage,
          onSignleButtonTap: () => context.pop(),
        );
      }
    });
  }

  Future<ExtraData?> checkPermission() async {
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

  void enterYoutubeUrl(BuildContext context) {
    context.push(EnterYoutubeUrlScreen.PATH);
  }

  Future<void> selectVideo(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(uploadVideoNotiferProvider.notifier)
            .uploadVideo()
            .then((value) {
          if (value) {
            context.push(EnterFeedFormScreen.PATH);
          }
        });
      } else {
        context.push(
          RequestGalleryPermissionScreen.PATH,
          extra: extraData,
        );
      }
    });
  }

  void useGallery({required ValueNotifier<bool> fromGallery}) {
    fromGallery.value = true;
  }

  void useYoutubeUrl({required ValueNotifier<bool> fromGallery}) {
    fromGallery.value = false;
  }

  void goNextStep() {}
}
