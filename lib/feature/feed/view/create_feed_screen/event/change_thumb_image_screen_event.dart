import 'dart:io';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/service/permission/permission_handler_service.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/util/url_util.dart';
import 'package:gamemuncheol/feature/feed/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/request_gallery_and_camera_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/video_file_preview_screen.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/youtube_url_preview_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:gamemuncheol/feature/feed/provider/change_thumbnail_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

mixin ChangeThumbImageScreenEvent {
  void onLeadingTap() {
    locator.navKey.context.pop();
  }

  void onBottomButtonTap() {
    locator.navKey.context.pop();
  }

  void listenError(
    WidgetRef ref, {
    required DialogService dialogService,
  }) {
    ref.listen(changeThumbNailNotifierProvider, (previous, next) {
      if (next.isError && next.erMessage.isNotEmpty) {
        dialogService.showSingleButtonDialog(
          locator.navKey.context,
          title: "업로드 실패",
          description: next.erMessage,
          onSignleButtonTap: () => locator.navKey.context.pop(),
        );
      }
    });
  }

  Future<void> changeThumbnail(WidgetRef ref) async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(changeThumbNailNotifierProvider.notifier)
            .changeThumbnail();
      } else {
        locator.navKey.context.push(
          RequestGalleryPermissionScreen.PATH,
          extra: extraData,
        );
      }
    });
  }

  Future<ExtraData?> checkPermission() async {
    bool hasGalleryPermission = Platform.isAndroid
        ? true
        : await PermissionHandlerService.checkPermission(Permission.photos);

    bool hasCameraPermission =
        await PermissionHandlerService.checkPermission(Permission.camera);

    if (!hasGalleryPermission || !hasCameraPermission) {
      final ExtraData extraData = ExtraData({
        "hasGalleryPermission": hasGalleryPermission,
        "hasCameraPermission": hasCameraPermission,
      });

      return extraData;
    }

    return null;
  }

  void pushPreviewScreen(WidgetRef ref) {
    final pState = ref.read(videoUploadNotifierProvider).pState;

    // 파일 선택 시
    if (pState.isVideoFileSelect) {
      final File videoFile = pState.videoFile;
      _pushVideoFilePreviewScreen(videoFile);
    } else {
      // 유튜브 url 선택 시
      final String youtubeUrl = pState.youtubeUrl;
      _pushYoutubeUrlPreviewScreen(UrlUtil.urlToYoutubeId(youtubeUrl)!);
    }
  }

  void _pushVideoFilePreviewScreen(File videoFile) {
    final ExtraData extraData = ExtraData(
        {"videoPlayerController": VideoPlayerController.file(videoFile)});
    locator.navKey.context.push(VideoFilePreviewScreen.PATH, extra: extraData);
  }

  void _pushYoutubeUrlPreviewScreen(String videoId) {
    final ExtraData extraData = ExtraData(
        {"playerController": YoutubePlayerController(initialVideoId: videoId)});
    locator.navKey.context.push(YoutubeUrlPreviewScreen.PATH, extra: extraData);
  }
}
