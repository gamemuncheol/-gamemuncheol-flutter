import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/di/locator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_feed_form_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/enter_youtube_url_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart';

mixin VideoUploadScreenEvent {
  void onLeadingTap(BuildContext context) {
    context.pop();
  }

  void listenError(
    BuildContext context,
    WidgetRef ref, {
    required DialogService dialogService,
  }) {
    ref.listen(videoUploadNotifierProvider, (previous, next) {
      if (next.isError && next.erMessage.isNotEmpty) {
        dialogService.showSingleButtonDialog(
          context,
          title: "업로드 실패",
          description: next.erMessage,
          onSignleButtonTap: () => context.pop(),
        );
      }
    });
  }

  void enterYoutubeUrl(BuildContext context) {
    context.push(EnterYoutubeUrlScreen.PATH);
  }

  Future<void> selectVideo(
    WidgetRef ref, {
    required Future<ExtraData?> Function() checkPermission,
  }) async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(videoUploadNotifierProvider.notifier)
            .uploadVideo()
            .then((value) {
          if (value) {
            locator.navKey.context.push(EnterFeedFormScreen.PATH);
          }
        });
      } else {
        locator.navKey.context.push(
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
}
