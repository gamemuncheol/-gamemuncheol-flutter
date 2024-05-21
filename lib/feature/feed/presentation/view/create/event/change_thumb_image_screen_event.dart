import 'dart:io';

import 'package:gamemuncheol/common/di/locator.dart';
import 'package:gamemuncheol/common/presentation/widget/app_dialog.dart';
import 'package:gamemuncheol/common/model/extra_data.dart';
import 'package:gamemuncheol/common/util/url_util.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumbnail_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/manage_permission_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/video_file_preview_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/youtube_url_preview_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gamemuncheol/common/service/dialog_service.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

mixin ChangeThumbImageScreenEvent {
  void onLeadingTap(WidgetRef ref) {
    // 변경 완료 없이 뒤로가면 원 상태로 복원
    ref
        .read(changeThumbNailNotifierProvider.notifier)
        .init(ref.read(videoUploadNotifierProvider).pState.byteThumbImage);

    locator.navKey.context.pop();
  }

  void onNextButtonTap() {
    locator.navKey.context.pop();
  }

  void listenError(
    WidgetRef ref, {
    required DialogService dialogService,
  }) {
    ref.listen(changeThumbNailNotifierProvider, (previous, next) {
      if (next.isError && next.erMessage.isNotEmpty) {
        dialogService.show(
          content: AppDialog.singleButton(
            title: "업로드 실패",
            description: next.erMessage,
            onSignleButtonTap: () => locator.navKey.context.pop(),
          ),
        );
      }
    });
  }

  Future<void> changeThumbnail(
    WidgetRef ref, {
    required Future<ExtraData?> Function() checkPermission,
  }) async {
    await checkPermission().then((extraData) async {
      final bool selectable = extraData == null;

      if (selectable) {
        await ref
            .read(changeThumbNailNotifierProvider.notifier)
            .changeThumbnail();
      } else {
        locator.navKey.context.push(
          ManagePermissionScreen.PATH,
          extra: extraData,
        );
      }
    });
  }

  void onPreviewButtonTap(WidgetRef ref) {
    final pState = ref.read(videoUploadNotifierProvider).pState;

    if (pState.isVideoFileSelect) {
      _pushVideoFilePreviewScreen(pState.videoFile);
    } else {
      _pushYoutubeUrlPreviewScreen(UrlUtil.urlToYoutubeId(pState.youtubeUrl)!);
    }
  }

  void _pushVideoFilePreviewScreen(File videoFile) {
    final extraData = ExtraData(
        {"videoPlayerController": VideoPlayerController.file(videoFile)});

    locator.navKey.context.push(VideoFilePreviewScreen.PATH, extra: extraData);
  }

  void _pushYoutubeUrlPreviewScreen(String videoId) {
    final extraData = ExtraData(
        {"playerController": YoutubePlayerController(initialVideoId: videoId)});

    locator.navKey.context.push(YoutubeUrlPreviewScreen.PATH, extra: extraData);
  }
}
